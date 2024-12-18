import pandas as pd
import numpy as np

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional

import uvicorn
import time  # For simulating computation delay

import json
import re

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

data= pd.read_csv('C:/Users/smhrd/Desktop/EduBuddy/model/edubuddy_env/science_questions_extracted_keyword (1).csv',encoding="euc-kr")



def f(j):  # f() 함수는 제이슨 방식을 파이썬으로 불러오는 양식
    keyword = []
    # JSON 배열만 추출
    match = re.search(r'\[.*\]', j)
    if match:
        try:
            ar = json.loads(match.group(0))  # 유효한 JSON 문자열을 찾았으면 파싱합니다.
            for a in ar:
                keyword.append(a.get("name"))  # name 필드만 추출합니다.
        except json.JSONDecodeError:
            pass  # 파싱 오류 시 건너뜁니다.
    return " ".join(sorted(keyword))

# data DataFrame에 적용
data['keyword'] = data['keyword'].apply(lambda x: f(x))

data[['keyword']]


for f in['keyword', 'description']:
  data[f] = data[f].fillna('')

def combine (row) :
  try:
    return row['keyword'] + " " + row['description']
  except:
    print("Error:", row)

data['combined_features'] = data.apply(combine, axis=1)


korean_stop_words = [
    '이', '그', '저', '것', '들', '수', '등', '때문', '그리고', '그러나', '하지만', '및'
]


tfidfvec = TfidfVectorizer(analyzer='word', stop_words=korean_stop_words, norm= 'l2')
tfidf_matrix = tfidfvec.fit_transform(data['combined_features'])


sine_sim = cosine_similarity(tfidf_matrix)
df_cosine_sim = pd.DataFrame(sine_sim)
df_cosine_sim

class RequestData(BaseModel):
    input: str
    difficulty: Optional[int] = None  # 난이도는 선택 사항

class ResponseData(BaseModel):
    ids: List[int]  # 추천된 문제 ID 리스트


# 1. 난이도 추출 로직
def extract_difficulty(id_value):
    """id에서 난이도를 추출하는 함수"""
    # 난이도는 id의 세 번째 자리로 가정
    return int(str(id_value)[3])  # 4211063 -> '1'

# 데이터셋에 난이도 컬럼 추가
data['difficulty'] = data['id'].apply(extract_difficulty)

# 2. 난이도 기반 추천 함수
def recommend_problem_by_difficulty(input_keywords, difficulty=None, n=5):
    """
    키워드와 난이도를 기준으로 문제를 추천하는 함수.

    Args:
    input_keywords (str): 사용자가 입력한 키워드 문자열.
    difficulty (int): 난이도 필터 (예: 1, 2, 3).
    n (int): 추천할 문제 수. 기본값은 5.

    Returns:
    DataFrame: 추천 문제 리스트.
    """
    # 사용자 키워드 분리
    input_keyword_list = input_keywords.split()

    # 입력 키워드 리스트의 TF-IDF 벡터 생성
    input_tfidf = tfidfvec.transform([" ".join(input_keyword_list)])

    # 코사인 유사도 계산 (사용자 입력 vs 데이터셋)
    keyword_similarities = cosine_similarity(input_tfidf, tfidf_matrix).flatten()

    # 난이도로 필터링 (선택한 난이도에 해당하는 문제만)
    if difficulty is not None:
        filtered_data = data[data['difficulty'] == difficulty]
        filtered_indices = filtered_data.index
        filtered_similarities = keyword_similarities[filtered_indices]
    else:
        filtered_data = data
        filtered_similarities = keyword_similarities

    # 유사도를 기준으로 문제 정렬
    sorted_indices = filtered_similarities.argsort()[-n:][::-1]  # 상위 n개 인덱스

    # 추천 결과 반환
    return filtered_data.iloc[sorted_indices][['id', 'keyword', 'description']]


app = FastAPI();

@app.post("/recommend", response_model=ResponseData)
async def recommend_problems(request: RequestData):
    """
    추천 API: 사용자가 입력한 키워드와 난이도를 기반으로 문제를 추천합니다.

    Args:
    request (RequestData): input과 difficulty 정보를 포함한 요청 데이터.

    Returns:
    ResponseData: 추천된 문제의 ID 리스트.
    """
    # 사용자 입력 데이터 추출
    user_input = request.input
    difficulty_level = request.difficulty

    # 추천 로직 호출
    recommended_problems = recommend_problem_by_difficulty(user_input, difficulty=difficulty_level, n=5)
   
    # 추천된 문제의 ID 리스트 반환
    return {"ids": recommended_problems['id'].tolist()}