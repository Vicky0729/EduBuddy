package com.edububby.demo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edububby.demo.dto.ProblemSolvedDTO;

import com.edububby.demo.model.QuestionBank;
import com.edububby.demo.model.Upload;
import com.edububby.demo.service.PythonModelService;
import com.edububby.demo.service.QuestionService;
import com.edububby.demo.service.UploadMappingService;
import com.edububby.demo.service.UploadService;

import jakarta.servlet.http.HttpSession;



@Controller
public class QuizController {


    @Autowired
    QuestionService questionService;

    @Autowired
    UploadService uploadService;

    @Autowired
    PythonModelService pythonModelService;

    @Autowired
    UploadMappingService uploadMappingService;

    //업로드별 문제 출제
    @PostMapping("/QuizMaker")
    public String QuizMaker( @RequestParam("idx") Long uploadIdx,@RequestParam("difficulty") int difficulty,HttpSession session,RedirectAttributes redirectAttributes){

       
        System.out.println("가지고온 식별자:"+uploadIdx);
        System.out.println("가지고온 난이도:"+difficulty);
    
        
        session.setAttribute("uploadIdx", uploadIdx);
        session.setAttribute("difficulty", difficulty);

        String KeywordInput = uploadService.KeywordInput(uploadIdx);
        Upload uploadList = uploadService.findByUploadIdx(uploadIdx);
      
        

        List<Long> ModelQesIdxs = pythonModelService.getRecommendations(KeywordInput,difficulty);

        System.out.println(ModelQesIdxs);
        // uploadMapping 값 저장
        uploadMappingService.insertUploadMapping(ModelQesIdxs,uploadIdx);

        List<QuestionBank> questionList = questionService.UploadProblem(ModelQesIdxs);
        
        redirectAttributes.addFlashAttribute("uploadList", uploadList);
        redirectAttributes.addFlashAttribute("questionList", questionList);
        redirectAttributes.addFlashAttribute("difficulty", difficulty);

        return "redirect:/QuizMakerPage";


    }
    //다음 단계 문제 출제 
    @GetMapping("/NextLevel")
    public String NextLevel(HttpSession session,RedirectAttributes redirectAttributes) {

        System.out.println("NextLevel도착");
        int difficulty = (int)session.getAttribute("difficulty");
        Long uploadIdx = (Long)session.getAttribute("uploadIdx");

        System.out.println("가지고온 식별자:"+uploadIdx);
        System.out.println("가지고온 난이도:"+difficulty);
        



        if(difficulty>=3){
           
            redirectAttributes.addFlashAttribute("errorMessage","다음 난이도로 넘어갈 수 없습니다. 이미 최고 난이도입니다.");

            return "redirect:/CheckAnswerPage";

        }else{
            ++difficulty;
            session.setAttribute("difficulty", difficulty);

            String KeywordInput = uploadService.KeywordInput(uploadIdx);
            Upload uploadList = uploadService.findByUploadIdx(uploadIdx);
            

            List<Long> ModelQesIdxs = pythonModelService.getRecommendations(KeywordInput,difficulty);
            List<QuestionBank> questionList = questionService.UploadProblem(ModelQesIdxs);


            redirectAttributes.addFlashAttribute("uploadList",uploadList);
            redirectAttributes.addFlashAttribute("questionList",questionList);
            redirectAttributes.addFlashAttribute("difficulty",difficulty);
            return "redirect:/QuizMakerPage";
        }

       
    }
    
    //방금 푼 문제
    @GetMapping("/ProblemSolved")
    public String ProblemSolved(HttpSession session,RedirectAttributes redirectAttributes){

       System.out.println("ProblemSolved도착");
       List<Map<String, Object>> questions = (List<Map<String, Object>>) session.getAttribute("questions");
        System.out.println(questions);      


            List<Long> qesIdxList = questions.stream()
            .map(question -> Long.parseLong((String) question.get("qesIdx"))) // String을 Long으로 변환
            .collect(Collectors.toList());

        
       

        String userId = (String) session.getAttribute("user");

        
    
        List<ProblemSolvedDTO> questionList = questionService.ProblemSolved(qesIdxList, userId);
   
        redirectAttributes.addFlashAttribute("questionList", questionList);
    
        session.removeAttribute("questions");
        return "redirect:/ProblemSolvingPage";
    }

    // 목차별 문제 출제
    @PostMapping("/TypeProblem")
    public String TypeProblem(@RequestParam String qesIdxList,HttpSession session,RedirectAttributes redirectAttributes) {

        System.out.println("TypeProblem도착");
      
        List<Long> qesIdxListParsed = Arrays.stream(qesIdxList.replace("[", "").replace("]", "").split(","))
        .map(idx -> Long.valueOf(idx.trim())) // 공백 제거 후 숫자로 변환
        .collect(Collectors.toList());

        String userId = (String) session.getAttribute("user");

        List<ProblemSolvedDTO> questionList = questionService.ProblemSolved(qesIdxListParsed, userId);

        Map<Long, ProblemSolvedDTO> uniqueResults = questionList.stream()
        .collect(Collectors.toMap(
        ProblemSolvedDTO::getQesIdx,
        dto -> dto,
        (existing, replacement) -> {
            // 틀린 횟수를 합산
            existing.setWrongCnt(existing.getWrongCnt() + replacement.getWrongCnt());
            return existing;
        }
        ));


        List<ProblemSolvedDTO> finalList = new ArrayList<>(uniqueResults.values());
        redirectAttributes.addFlashAttribute("questionList", finalList);

        
        return "redirect:/ProblemSolvingPage";
    }
    
    //모든 문제
    @GetMapping("/AllProblem")
    public String AllProblem(HttpSession session,RedirectAttributes redirectAttributes) {

        System.out.println("AllProblem도착");

        
        String userId = (String)session.getAttribute("user");

       List<ProblemSolvedDTO> AllProblemList =  questionService.AllProblem(userId);


       redirectAttributes.addFlashAttribute("questionList", AllProblemList);



        return "redirect:/ProblemSolvingPage";
    }
    



   
    
    



   


}
