package com.edububby.demo.controller;

import org.springframework.web.bind.annotation.RestController;

import com.edububby.demo.service.UploadService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class HomeRestController {

    @Autowired
    UploadService uploadService;


    // 업로드 파일 수정 기능 
    @PostMapping("/uploadEdit")
    public void uploadEdit(@RequestBody Map<String, Object> requestData) {
        
        Long uploadIdx = Long.parseLong(requestData.get("idx").toString());
        String uploadFile = requestData.get("newTitle").toString();

        uploadService.editUploadFile(uploadIdx,uploadFile);
    }

    // 업로드 파일 삭제 기능 
    @PostMapping("/uploadDelete")
    public void uploadDelete(@RequestBody Map<String, Object> requestData) {
        
        Long uploadIdx = Long.parseLong(requestData.get("idx").toString());
        
       

        uploadService.deleteUploadFile(uploadIdx);
    }

    
    
    
    





}
