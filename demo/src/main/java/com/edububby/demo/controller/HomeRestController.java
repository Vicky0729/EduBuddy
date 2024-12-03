package com.edububby.demo.controller;

import org.springframework.web.bind.annotation.RestController;

import com.edububby.demo.service.UploadService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class HomeRestController {

    @Autowired
    UploadService uploadService;


    @PostMapping("/uploadEdit")
    public void uploadEdit(@RequestBody Map<String, Object> requestData) {
        
        Long uploadIdx = Long.parseLong(requestData.get("idx").toString());
        String uploadFile = requestData.get("newTitle").toString();

        uploadService.editUploadFile(uploadIdx,uploadFile);
    }

    @PostMapping("/uploadDelete")
    public void uploadDelete(@RequestBody Map<String, Object> requestData) {
        
        Long uploadIdx = Long.parseLong(requestData.get("idx").toString());
        
        System.out.println("jsp에서 가져온 IDX:"+uploadIdx);

        uploadService.deleteUploadFile(uploadIdx);
    }

    
    
    
    





}
