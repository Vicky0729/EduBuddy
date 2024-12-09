package com.edububby.demo.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
    public String uploadAudio(@RequestParam("file") MultipartFile file, Model model,Upload upload,HttpSession session) throws IOException {
        
        System.out.println("오디오 서비스 도착");
        //파이썬에서 텍스트화된 데이터 받아오기 
        String transcriptionText = audioService.transcribeAudio(file);
        System.out.println("텍스트화 결과: " + transcriptionText);
       
        String user = (String)session.getAttribute("test");
        String fileName = file.getOriginalFilename();
        upload.setUserId(user);
        upload.setUploadFile(fileName);
        upload.setUploadDt(LocalDateTime.now());
        upload.setUploadText(transcriptionText);
        uploadService.insertUpload(upload);


        
        return "result";  // result.jsp 페이지로 이동
    }







}
