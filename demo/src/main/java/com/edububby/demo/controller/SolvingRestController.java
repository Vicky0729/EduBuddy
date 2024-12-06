package com.edububby.demo.controller;

import org.springframework.web.bind.annotation.RestController;

import com.edububby.demo.service.SolvingService;

import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class SolvingRestController {

    @Autowired
    SolvingService solvingService;



    @PostMapping("/userQuizData")
    public String userQuizData(@RequestBody Map<String, Object> payload,HttpSession session) {


        

        List<Map<String, Object>> questions = (List<Map<String, Object>>) payload.get("questions");
        Long uploadIdx = (Long)session.getAttribute("uploadIdx");
        String userId = (String)session.getAttribute("user");


        System.out.println(questions);
        solvingService.insertSolving(uploadIdx,userId,questions);
        
        
      
        session.setAttribute("questions", questions);

        

        
        return "redirect:/CheckAnswer";
    }
   
    



}
