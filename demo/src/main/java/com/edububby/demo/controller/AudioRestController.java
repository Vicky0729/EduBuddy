package com.edububby.demo.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.edububby.demo.model.Upload;
import com.edububby.demo.service.AudioService;
import com.edububby.demo.service.UploadService;
import com.google.api.Http;

import jakarta.servlet.http.HttpSession;




@RestController
public class AudioRestController {

    @Autowired
    AudioService audioService;      

    @Autowired
    UploadService uploadService;



    // vito stt 기능 
    @PostMapping("/upload-audio")
    public ResponseEntity<Map<String, Object>> uploadAudio(@RequestParam("file") MultipartFile file,HttpSession session) throws IOException {
    
    Map<String, Object> response = new HashMap<>();
    
    try {
        System.out.println("오디오 서비스 도착");

        // 파이썬에서 텍스트화된 데이터 받아오기
        Map<String, Object> result = audioService.transcribeAudio(file);


        // 세션에서 사용자 정보 가져오기
        String userId = (String)session.getAttribute("user");
        String fileName = file.getOriginalFilename();


        String transcription = (String) result.get("transcription");
        List<String> keywords = (List<String>) result.get("keywords");
        

        // 업로드 정보 저장
        Upload upload = new Upload();
        upload.setUserId(userId);
        upload.setUploadFile(fileName);
        upload.setUploadDt(LocalDateTime.now());
        upload.setUploadText(transcription);

        if (keywords != null) {
            if (keywords.size() > 0) upload.setKeyword1(keywords.get(0));
            if (keywords.size() > 1) upload.setKeyword2(keywords.get(1));
            if (keywords.size() > 2) upload.setKeyword3(keywords.get(2));
            if (keywords.size() > 3) upload.setKeyword4(keywords.get(3));
            if (keywords.size() > 4) upload.setKeyword5(keywords.get(4));
        }


        uploadService.insertUpload(upload);

        // 성공 응답 구성
        response.put("success", true);
        response.put("message", "업로드가 성공적으로 완료되었습니다!");
        response.put("transcriptionText", result);

        return ResponseEntity.ok(response);
    } catch (Exception e) {
        e.printStackTrace();

        // 실패 응답 구성
        response.put("success", false);
        response.put("message", "업로드 중 오류가 발생했습니다.");
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    }
}

    // 유튜브 링크 자막 추출
    @PostMapping("/youtubeLink")
    public String getTranscript(@RequestBody Map<String, String> payload,HttpSession session) {

        System.out.println("youtubeLink도착");
        String youtubeLink = payload.get("youtubeLink");

        // YouTube URL에서 video_id 추출
        String videoId = youtubeLink.split("v=")[1];
        if (videoId.contains("&")) {
            videoId = videoId.split("&")[0];
        }

        Map<String, Object> result = audioService.youtubeLink(videoId);

        String userId = (String) session.getAttribute("user");
        

        // 텍스트 및 키워드 추출
        String transcription = (String) result.get("transcription");
        List<String> keywords = (List<String>) result.get("keywords");

        System.out.println(keywords);

        // 업로드 정보 저장
        Upload upload = new Upload();
        upload.setUserId(userId);
        upload.setUploadFile(videoId);
        upload.setUploadDt(LocalDateTime.now());
        upload.setUploadText(transcription);

        // 키워드 필드에 매핑 (최대 5개 키워드 저장)
        if (keywords != null) {
            if (keywords.size() > 0) upload.setKeyword1(keywords.get(0));
            if (keywords.size() > 1) upload.setKeyword2(keywords.get(1));
            if (keywords.size() > 2) upload.setKeyword3(keywords.get(2));
            if (keywords.size() > 3) upload.setKeyword4(keywords.get(3));
            if (keywords.size() > 4) upload.setKeyword5(keywords.get(4));
        }

        // Upload 객체 DB에 저장
        uploadService.insertUpload(upload);


       

        // 파이썬 서비스 호출
        return "result";


    }





}
