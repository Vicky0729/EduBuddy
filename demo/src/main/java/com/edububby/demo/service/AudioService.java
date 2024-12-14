package com.edububby.demo.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class AudioService {

    // 음성 파일 텍스트화 및 키워드 추출
    public Map<String, Object> transcribeAudio(MultipartFile file) throws IOException {
        // 1. Python 서버의 엔드포인트 URL 설정
        String url = "http://localhost:5000/transcribe";  // Python FastAPI 서버 주소

        // 2. HTTP 요청 헤더 및 바디 설정
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", new org.springframework.core.io.ByteArrayResource(file.getBytes()) {
            @Override
            public String getFilename() {
                return file.getOriginalFilename();
            }
        });

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        // 3. Python 서버로 파일 전송 및 응답 받기
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseBody = response.getBody();

        // 4. 응답 확인 및 반환
        if (response.getStatusCode().is2xxSuccessful() && responseBody != null) {
            return responseBody; // transcription 및 keywords 포함한 전체 데이터 반환
        } else {
            throw new RuntimeException("Failed to transcribe audio: " + response.getStatusCode());
        }
    }

    // 유튜브 자막 추출 및 키워드 추출
    public Map<String, Object> youtubeLink(String videoId) {

        System.out.println("youtubeLink 도착");
        // 1. Python 서버의 엔드포인트 URL 설정
        String pythonApiUrl = "http://localhost:5000/youtubeLink"; // Python FastAPI 서버 주소

        // 2. 요청 데이터 생성
        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> requestPayload = new HashMap<>();
        requestPayload.put("video_id", videoId);

        // 3. 요청 전송 및 응답 수신
        ResponseEntity<Map> response = restTemplate.postForEntity(pythonApiUrl, requestPayload, Map.class);

        System.out.println(response);

        // 4. 응답 확인 및 반환
        if (response.getStatusCode().is2xxSuccessful()) {
            Map<String, Object> responseBody = response.getBody();

            if (responseBody != null && responseBody.containsKey("transcription") && responseBody.containsKey("keywords")) {
                return responseBody; // transcription 및 keywords 포함한 전체 데이터 반환
            } else {
                throw new RuntimeException("Unexpected response format: Missing 'transcription' or 'keywords'");
            }
        } else {
            throw new RuntimeException("Failed to fetch transcript: " + response.getStatusCode());
        }
    }
}
