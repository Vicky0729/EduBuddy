package com.edububby.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class SolvingController {





     @GetMapping("/CheckAnswer")
    public String CheckAnswerPage(HttpSession session,Model model) {
       
        List<Map<String, Object>> questions = (List<Map<String, Object>>) session.getAttribute("questions");

        System.out.println(questions); // 데이터 출력

        model.addAttribute("questions", questions);


        return "redirect:/CheckAnswerPage";

    }

    @GetMapping("/ProblemSolved")
    public String ProblemSolved(){





        return new String();
    }

    
    
    

    
    




}
