from fastapi import FastAPI, File, UploadFile, HTTPException
from pydantic import BaseModel
from typing import List
from kiwipiepy import Kiwi
from keybert import KeyBERT
from sklearn.feature_extraction.text import TfidfVectorizer
from sentence_transformers import SentenceTransformer, util
from pykospacing import Spacing
from youtube_transcript_api import YouTubeTranscriptApi
import requests
import json
import time
from collections import Counter

# FastAPI 초기화
app = FastAPI()

# 사용자 정의 불용어 리스트


# Kiwi 초기화
kiwi = Kiwi()
kw_model = KeyBERT()
spacing = Spacing()

url1 = "https://raw.githubusercontent.com/Vicky0729/EduBuddy/refs/heads/Main/keyword.txt"

response1 = requests.get(url1)
keyword = response1.text.splitlines()




# Vito API 설정
vito_config = {
    "use_diarization": True,
    "diarization": {"spk_count": 2},
    "use_itn": True,
    "use_disfluency_filter": True,
    "use_profanity_filter": False,
    "use_paragraph_splitter": True,
    "paragraph_splitter": {"max": 50}
}


url = "https://raw.githubusercontent.com/Vicky0729/EduBuddy/refs/heads/Main/stopwords.txt"
response = requests.get(url)
custom_stopwords = response.text.splitlines()


# 사용자 정의 불용어 리스트


# Kiwi 초기화
kiwi = Kiwi()

def extract_keywords(text: str, top_n: int = 5, similarity_threshold: float = 0.2) -> List[str]:
    
    """
    텍스트에서 키워드를 추출하는 함수.
    :param text: 입력 텍스트
    :param top_n: 추출할 키워드 개수 (기본값: 5)
    :param similarity_threshold: 필터링된 문장 유사도 기준 (기본값: 0.2)
    :return: 키워드 리스트
    """
    try:
        # Step 1: 띄어쓰기 교정 (옵션 - 필요한 경우 추가적인 라이브러리 활용)
        corrected_text = text  # 기본적으로는 텍스트 그대로 사용

        # Step 2: 문장 분리
        sentences = [sent.text for sent in kiwi.split_into_sents(corrected_text)]
        print(sentences)
        # Step 3: Sentence-BERT와 키워드 비교 (선택적 유사도 기반 필터링)
        keywords_for_similarity = keyword
        model = SentenceTransformer('sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2')
        keyword_embedding = model.encode(keywords_for_similarity)
        sentence_embeddings = model.encode(sentences)
        print(sentence_embeddings)
        # 유사도 계산 및 필터링된 문장 선택
        filtered_sentences = []
        for i, sent_emb in enumerate(sentence_embeddings):
            similarity_scores = util.cos_sim(sent_emb, keyword_embedding).mean()
            if similarity_scores > similarity_threshold:
                filtered_sentences.append(sentences[i])

        # Step 4: 명사 추출
        nouns = []
        for sentence in filtered_sentences:
            tokens = kiwi.tokenize(sentence, normalize_coda=True)
            sentence_nouns = [token.form for token in tokens if token.tag in ['NNG', 'NNP', 'NNB']]
            sentence_nouns = [noun for noun in sentence_nouns if noun not in custom_stopwords]
            nouns.extend(sentence_nouns)  # 명사 리스트에 추가

        # Step 5: 명사 텍스트 결합 및 TF-IDF 계산
        noun_text = " ".join(nouns)
        if not noun_text.strip():
            return []  # 키워드가 없으면 빈 리스트 반환

        # Step 6: 단어 빈도를 기반으로 Top N 키워드 추출
        word_counts = Counter(noun_text.split())
        extracted_keywords = word_counts.most_common(top_n)

        # 키워드 리스트 생성
        keywords_list = [keyword[0] for keyword in extracted_keywords]

       
        return keywords_list

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Keyword extraction failed: {str(e)}")



# 음성 파일 텍스트화 엔드포인트
@app.post("/transcribe")
async def transcribe(file: UploadFile = File(...)):
    try:
        # Vito API 인증
        print("transcribe 도착")
        vito_auth_resp = requests.post(
            'https://openapi.vito.ai/v1/authenticate',
           data={'client_id': '5ZlST7B9EFdDV5YESXzI', 'client_secret': '36dsqoQPfrxIAdsj8YHePnR3BDxdfKa4Bt_frAsY'}
        )
        vito_auth_resp.raise_for_status()
        jwt_token = vito_auth_resp.json().get("access_token")

        # Vito API로 음성 파일 전송
        vito_transcribe_resp = requests.post(
            'https://openapi.vito.ai/v1/transcribe',
            headers={'Authorization': f'bearer {jwt_token}'},
            data={'config': json.dumps(vito_config)},
            files={'file': (file.filename, await file.read())}
        )
        vito_transcribe_resp.raise_for_status()
        job_id = vito_transcribe_resp.json().get("id")
     
        # 작업 완료 대기 및 결과 조회
        transcription_text = None
        while True:
            status_resp = requests.get(
                f'https://openapi.vito.ai/v1/transcribe/{job_id}',
                headers={'Authorization': f'bearer {jwt_token}'}
            )
            status_resp.raise_for_status()
            status_data = status_resp.json()

            if status_data.get("status") == "completed":
                utterances = status_data["results"]["utterances"]
                transcription_text = " ".join([utterance["msg"] for utterance in utterances])
                break
            elif status_data.get("status") == "failed":
                raise HTTPException(status_code=500, detail="Transcription failed.")
            
            # 대기 시간
            time.sleep(5)

        # 키워드 추출
        keywords = extract_keywords(transcription_text)

        # 결과 반환
        return {"transcription": transcription_text, "keywords": keywords}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# 유튜브 자막 추출 엔드포인트
class VideoLinkRequest(BaseModel):
    video_id: str

@app.post("/youtubeLink")
async def get_transcript(request: VideoLinkRequest):
    try:
        # 유튜브 자막 추출
        transcript = YouTubeTranscriptApi.get_transcript(request.video_id, languages=['ko'])
        texts = " ".join([entry['text'] for entry in transcript])

        # 키워드 추출
        keywords = extract_keywords(texts)



        # 결과 반환
        return {"transcription": texts, "keywords": keywords}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
