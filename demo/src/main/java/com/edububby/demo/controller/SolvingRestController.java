package com.edububby.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edububby.demo.service.SolvingService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class SolvingRestController {

    @Autowired
    SolvingService solvingService;


    // 푼 문제 저장 기능 
    @PostMapping("/userQuizData")
    public ResponseEntity<?> userQuizData(@RequestBody Map<String, Object> payload,HttpSession session,HttpServletRequest request) {


        System.out.println("userQuizData도착");
        

        List<Map<String, Object>> questions = (List<Map<String, Object>>) payload.get("questions");
        Long uploadIdx = (Long)session.getAttribute("uploadIdx");
        String userId = (String)session.getAttribute("user");


     
        
        solvingService.insertSolving(userId,questions);
        
        
        session.setAttribute("questions", questions);
       
        return ResponseEntity.ok("Success");
    }

    
    // 목차별 푼 문제 저장 기능 
    @PostMapping("/TypeQuizData")
    public ResponseEntity<?> TypeQuizData(@RequestBody Map<String, Object> payload,HttpSession session){

        List<Map<String, Object>> questions = (List<Map<String, Object>>) payload.get("questions");
        String userId = (String)session.getAttribute("user");

        solvingService.updateSolving(userId,questions);

        session.setAttribute("questions", questions);


        return ResponseEntity.ok("Success");
    }



}
