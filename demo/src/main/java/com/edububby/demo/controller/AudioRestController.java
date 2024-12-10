package com.edububby.demo.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.edububby.demo.model.Upload;
import com.edububby.demo.service.AudioService;
import com.edububby.demo.service.UploadService;

import jakarta.servlet.http.HttpSession;




@RestController
public class AudioRestController {

    @Autowired
    AudioService audioService;      

    @Autowired
    UploadService uploadService;



    @PostMapping("/upload-audio")
public ResponseEntity<Map<String, Object>> uploadAudio(@RequestParam("file") MultipartFile file,HttpSession session) throws IOException {
    
    Map<String, Object> response = new HashMap<>();
    
    try {
        System.out.println("오디오 서비스 도착");

        // 파이썬에서 텍스트화된 데이터 받아오기
        String transcriptionText = audioService.transcribeAudio(file);
        System.out.println("텍스트화 결과: " + transcriptionText);

        // 세션에서 사용자 정보 가져오기
        String user = (String)session.getAttribute("user");
        String fileName = file.getOriginalFilename();

        // 업로드 정보 저장
        Upload upload = new Upload();
        upload.setUserId(user);
        upload.setUploadFile(fileName);
        upload.setUploadDt(LocalDateTime.now());
        upload.setUploadText(transcriptionText);
        uploadService.insertUpload(upload);

        // 성공 응답 구성
        response.put("success", true);
        response.put("message", "업로드가 성공적으로 완료되었습니다!");
        response.put("transcriptionText", transcriptionText);
        return ResponseEntity.ok(response);
    } catch (Exception e) {
        e.printStackTrace();

        // 실패 응답 구성
        response.put("success", false);
        response.put("message", "업로드 중 오류가 발생했습니다.");
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    }
}


    @PostMapping("/youtubeLink")
    public String getTranscript(@RequestBody Map<String, String> payload) {

        System.out.println("youtubeLink도착");
        String youtubeLink = payload.get("youtubeLink");

        // YouTube URL에서 video_id 추출
        String videoId = youtubeLink.split("v=")[1];
        if (videoId.contains("&")) {
            videoId = videoId.split("&")[0];
        }

        String text = audioService.youtubeLink(videoId);

        System.out.println(text);

        // 파이썬 서비스 호출
        return "result";


    }





}
