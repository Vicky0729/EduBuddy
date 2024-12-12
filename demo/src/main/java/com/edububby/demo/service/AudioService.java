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

    // vito stt 기능
     public String transcribeAudio(MultipartFile file) throws IOException {
        // 1. Python 서버의 엔드포인트 URL 설정
        String url = "http://localhost:5000/transcribe";  // Python 서버 주소

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

        // 4. 변환된 텍스트 결과 반환
        return (String) responseBody.get("transcription");
    }

     // 유튜브 자막 추출 기능
     public String youtubeLink(String videoId) {
        System.out.println("audioService 도착");
        String pythonApiUrl = "http://localhost:5000/youtubeLink";

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> requestPayload = new HashMap<>();
        requestPayload.put("video_id", videoId);

        ResponseEntity<Map> response = restTemplate.postForEntity(pythonApiUrl, requestPayload, Map.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            Map<String, Object> responseBody = response.getBody();

            if (responseBody != null && responseBody.containsKey("transcript")) {
                return responseBody.get("transcript").toString(); // "text" 키의 값을 반환

            } else {
                throw new RuntimeException("Unexpected response format: Missing 'text' key");
            }
        } else {
            throw new RuntimeException("Failed to fetch transcript: " + response.getStatusCode());
        }
    }
   


}
