package com.edububby.demo.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edububby.demo.dto.ProblemSolvedDTO;
import com.edububby.demo.dto.QuestionCountDTO;
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

        int difficulty = (int) session.getAttribute("difficulty");
        Long uploadIdx = (Long)session.getAttribute("uploadIdx");
       

        if(difficulty>=3){
           
            redirectAttributes.addFlashAttribute("errorMessage","다음 난이도로 넘어갈 수 없습니다. 이미 최고 난이도입니다.");

            return "redirect:/CheckAnswerPage";
        }else{
            ++difficulty;
            session.setAttribute("difficulty", difficulty);
            List<QuestionBank> questionList = questionService.QuestionSubmit(uploadIdx, difficulty);
            redirectAttributes.addFlashAttribute("questionList",questionList);
            return "redirect:/QuizMakerPage";
        }

       
    }
    
    @GetMapping("/ProblemSolved")
    public String ProblemSolved(HttpSession session,RedirectAttributes redirectAttributes){

       List<Map<String, Object>> questions = (List<Map<String, Object>>) session.getAttribute("questions");

       List<Long> qesIdxList = questions.stream()
        .map(question -> (Long) question.get("qesIdx"))
        .collect(Collectors.toList());


    String userId = (String) session.getAttribute("user");
    // DB에서 문제 검색
    
    List<ProblemSolvedDTO> questionList = questionService.ProblemSolved(qesIdxList, userId); 

    // 데이터 RedirectAttributes에 추가
    redirectAttributes.addFlashAttribute("questionList", questionList);


        return "redirect:/ProblemSolvingPage";
    }

   
    
    



   


}
