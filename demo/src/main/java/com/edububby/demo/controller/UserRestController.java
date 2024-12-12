package com.edububby.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edububby.demo.service.AcademicService;
import com.edububby.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class UserRestController {
    
    @Autowired
    private UserService userService;

    @Autowired
    AcademicService academicService;

    // 아이디 중복 체크
    @PostMapping("/IdCheck")
    public ResponseEntity<Map<String, Boolean>> IdCheck(@RequestParam String userId){
        boolean exist = userService.IdExist(userId);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exist);
        return ResponseEntity.ok(response);
    }

    // 유저이름 수정 기능 
    @PostMapping("/updateUserName")
    public void updataUserName(@RequestParam("userName") String userName,HttpSession session) {
        
        String userId = (String)session.getAttribute("user");



        userService.updateUserName(userId, userName);   
        
        session.setAttribute("userName", userName);
        
    }

    // 유저 학년 수정 기능
    @PostMapping("/updateAcademicType")
    public void updateAcademicType(@RequestParam("academicType") String academicType,HttpSession session) {

        System.out.println("updateAcademicType 도착");
        String userId = (String)session.getAttribute("user");

        academicService.updateAcademicType(userId,academicType);
        
        
        
    }

    // 유저 학교 이름 수정 기능
    @PostMapping("/updateSchoolName")
    public void updateSchoolName(@RequestParam("SchoolName") String SchoolName,HttpSession session) {

        System.out.println("updateSchoolName 도착");
        String userId = (String)session.getAttribute("user");
        
        academicService.updateSchoolName(userId,SchoolName);
        
    }
    






}
