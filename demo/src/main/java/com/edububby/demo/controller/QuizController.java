package com.edububby.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edububby.demo.model.QuestionBank;
import com.edububby.demo.service.QuestionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuizController {


    @Autowired
    QuestionService questionService;

    
    @PostMapping("/QuizMaker")
    public String QuizMaker( @RequestParam("idx") Long uploadIdx,@RequestParam("difficulty") String difficulty,Model model,HttpSession session){

        int qesLevel; 
        System.out.println("가지고온 식별자:"+uploadIdx);
        System.out.println("가지고온 난이도:"+difficulty);
        
        session.setAttribute("uploadIdx", uploadIdx);


        if(difficulty.equals("개념")){
            qesLevel=1;
        }else if(difficulty.equals("중급")){
            qesLevel=2;
        }else{
            qesLevel=3;
        }

        List<QuestionBank> questionList = questionService.QuestionSubmit(uploadIdx, qesLevel);

        model.addAttribute("questionList", questionList);
        model.addAttribute("difficulty", difficulty);


        return "QuizMaker";
    }



   


}
