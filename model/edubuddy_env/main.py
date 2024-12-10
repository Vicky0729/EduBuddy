from fastapi import FastAPI, File, UploadFile,HTTPException
from pydantic import BaseModel
from youtube_transcript_api import YouTubeTranscriptApi
import requests
import json




app = FastAPI()

# Vito API를 사용하여 음성 파일을 텍스트로 변환하는 엔드포인트
config = {
    "use_diarization": True,
    "diarization": {
        "spk_count": 2
    },
    "use_itn": True,
    "use_disfluency_filter": True,
    "use_profanity_filter": False,
    "use_paragraph_splitter": True,
    "paragraph_splitter": {
        "max": 50
    }
}

@app.post("/transcribe")
async def transcribe(file: UploadFile = File(...)):
    # Vito API 인증
    vito_auth_resp = requests.post(
        'https://openapi.vito.ai/v1/authenticate',
        data={'client_id': '5ZlST7B9EFdDV5YESXzI', 'client_secret': '36dsqoQPfrxIAdsj8YHePnR3BDxdfKa4Bt_frAsY'}
    )
    vito_auth_resp.raise_for_status()
    jwt_token = vito_auth_resp.json().get("access_token")

    # Vito API로 음성 파일 전송 및 작업 ID 수신
    vito_transcribe_resp = requests.post(
        'https://openapi.vito.ai/v1/transcribe',
        headers={'Authorization': f'bearer {jwt_token}'},
        data={'config': json.dumps(config)},
        files={'file': (file.filename, await file.read())}
    )
    vito_transcribe_resp.raise_for_status()
    job_id = vito_transcribe_resp.json().get("id")

    # 작업 완료까지 대기 및 결과 조회
    transcription_result = None
    while True:
        # 작업 상태 확인
        status_resp = requests.get(
            f'https://openapi.vito.ai/v1/transcribe/{job_id}',
            headers={'Authorization': f'bearer {jwt_token}'}
        )
        status_resp.raise_for_status()
        status_data = status_resp.json()

        # 작업이 완료되었는지 확인
        if status_data.get("status") == "completed":
            utterances = status_data["results"]["utterances"]
            # 메시지들을 하나의 문자열로 결합
            transcription_text = " ".join([utterance["msg"] for utterance in utterances])
            break
        elif status_data.get("status") == "failed":
            return {"error": "Transcription failed", "details": status_data}

        # 일정 시간 대기
        import time
        time.sleep(5)

    # 최종 텍스트 변환 결과 반환
    return {"transcription": transcription_text}



# 요청 모델 정의
class VideoLinkRequest(BaseModel):
    video_id: str

@app.post("/youtubeLink")
async def get_transcript(request: VideoLinkRequest):
    try:
        transcript = YouTubeTranscriptApi.get_transcript(request.video_id, languages=['ko'])
        texts = [entry['text'] forgit  entry in transcript]
        return {"video_id": request.video_id, "transcript": texts}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))