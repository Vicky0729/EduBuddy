package com.edububby.demo.service;


import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;



@Service
public class PythonModelService {
    
    // 파이썬 추천 서비스 기능
     public List<Long> getRecommendations(String input, Integer difficulty) {
        String FASTAPI_URL = "http://localhost:8000/recommend";
        try {
            // 요청 데이터 생성
            Map<String, Object> requestData = Map.of(
                "input", input,
                "difficulty", difficulty
            );

            // HTTP 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            // 요청 생성
            ObjectMapper objectMapper = new ObjectMapper();
            String requestJson = objectMapper.writeValueAsString(requestData);
            HttpEntity<String> requestEntity = new HttpEntity<>(requestJson, headers);

            // RestTemplate 호출
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map> response = restTemplate.exchange(
                FASTAPI_URL,
                HttpMethod.POST,
                requestEntity,
                Map.class
            );

            // 응답 데이터 처리
            Map<String, Object> responseBody = response.getBody();
            List<Long> ids = (List<Long>) responseBody.get("ids");
            return ids;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("추천 API 호출 실패");
        }
    }









}
