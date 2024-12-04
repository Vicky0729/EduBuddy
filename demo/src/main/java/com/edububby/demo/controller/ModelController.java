package com.edububby.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller

public class ModelController {
    // 모델 페이지로 이동하는 요청
    @RequestMapping("/model")
    public String showModelPage() {
        return "model";  // model.jsp 페이지를 반환
    }

    // Python 스크립트를 실행하는 요청 처리
    @PostMapping("/run-python")
    @ResponseBody
    public String runPythonScript() {
        try {
            // FastAPI 서버의 /run-python 엔드포인트로 POST 요청을 보냄
            RestTemplate restTemplate = new RestTemplate();
            String apiUrl = "http://127.0.0.1:8000/run-python"; // FastAPI 서버 주소
            String response = restTemplate.postForObject(apiUrl, null, String.class);

            // FastAPI 서버에서 받은 응답을 반환
            return "FastAPI 응답: " + response;
        } catch (Exception e) {
            e.printStackTrace();
            return "Python 스크립트를 실행할 수 없습니다.";
        }
    }
    
}
