package com.edububby.demo.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;


import com.edububby.demo.model.Upload;

import com.edububby.demo.service.UploadService;
import com.edububby.demo.service.UserService;

import jakarta.servlet.http.HttpSession;



@Controller
public class HomeController {

    @Autowired
    UserService userservice;

    @Autowired
    UploadService uploadService;
   
    // 로그인 기능 구현
    @PostMapping("/Home")
    public String HomePage(HttpSession session) {
        String user = "user_id 0001";
        System.out.println(user);
        session.setAttribute("user", user);
        return "home";
    }

    // 회원의 업로드된 파일 출력
    @GetMapping("/Problem")
    public String UploadLecturePage(HttpSession session,Model model) {
       
        
        String userId = (String)session.getAttribute("user");
        List<Upload> uploadList = uploadService.allUploadByUserId(userId);

        model.addAttribute("uploadList", uploadList);

        
        return "UploadLecture";
    }


    
    
   
    


}
