package com.edububby.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edububby.demo.model.QuestionBank;
import com.edububby.demo.service.QuestionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuizController {


    @Autowired
    QuestionService questionService;

    
    @PostMapping("/QuizMaker")
    public String QuizMaker( @RequestParam("idx") Long uploadIdx,@RequestParam("difficulty") int difficulty, RedirectAttributes redirectAttributes,HttpSession session){

       
        System.out.println("가지고온 식별자:"+uploadIdx);
        System.out.println("가지고온 난이도:"+difficulty);
    
        
        session.setAttribute("uploadIdx", uploadIdx);
        session.setAttribute("difficulty", difficulty);

        List<QuestionBank> questionList = questionService.QuestionSubmit(uploadIdx, difficulty);
        redirectAttributes.addFlashAttribute("questionList", questionList);
        redirectAttributes.addFlashAttribute("difficulty", difficulty);

        return "redirect:/QuizMakerPage";


    }

    @GetMapping("/NextLevel")
    public String NextLevel(HttpSession session,RedirectAttributes redirectAttributes) {

        int qesLevel = (int) session.getAttribute("difficulty");
        Long uploadIdx = (Long)session.getAttribute("uploadIdx");
       

        if(qesLevel>3){




            return null;
        }else{
            ++qesLevel;
            List<QuestionBank> questionList = questionService.QuestionSubmit(uploadIdx, qesLevel);
            return "redirect:/QuizMakerPage";
        }

       
    }
    

   
    
    



   


}
