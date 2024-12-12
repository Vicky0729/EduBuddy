package com.edububby.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import com.edububby.demo.dto.QuestionCountDTO;
import com.edububby.demo.model.Academic;
import com.edububby.demo.model.Upload;
import com.edububby.demo.model.User;
import com.edububby.demo.service.AcademicService;
import com.edububby.demo.service.QuestionService;
import com.edububby.demo.service.SolvingService;
import com.edububby.demo.service.UploadService;
import com.edububby.demo.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class HomeController {

    @Autowired
    UserService userservice;

    @Autowired
    UploadService uploadService;
    
    @Autowired
    QuestionService questionService;

    @Autowired
    SolvingService solvingService;

    @Autowired
    AcademicService academicService;
    

     // 첫페이지
     @GetMapping("/")
     public String Main() {
 
 
     
         return "login";
     }
     // 기존 회원 로그인 페이지
     @GetMapping("/PhoneloginPage")
     public String phoneLoginPage(){
 
         
 
 
         return "phonelogin";
     }

   


    //회원가입 페이지(회원정보)
    @GetMapping("/IdinfoPage")
    public String joinUser(){
        

    
        return "Idinfo";
    }

    //회원가입 페이지(학력 정보 )
    @GetMapping("/StudentInfoPage")
    public String StudentInfoPage() {


        return "StudentInfo";
    }
    
    // 홈페이지 이동
    @GetMapping("/HomePage")
    public String HomePage(){
        
        
        return "home";
    }
    

    // 회원의 업로드된 파일 출력
    @GetMapping("/UploadLecturePage")
    public String UploadLecturePage(HttpSession session,Model model) {
       
        
        String userId = (String)session.getAttribute("user");
        List<Upload> uploadList = uploadService.allUploadByUserId(userId);

        model.addAttribute("uploadList", uploadList);

        
        return "UploadLecture";
    }

    //오답노트 페이지 
    @GetMapping("/ReviewPage")
    public String Review(HttpSession session,Model model) {

        String userId = (String)session.getAttribute("user");

        List<QuestionCountDTO> qesCountList = questionService.findQuestionCountWithQesIdxByUserId(userId);
        System.out.println(qesCountList);
        model.addAttribute("qesCountList", qesCountList);


        return "Review";
    }

    // 학습여정 페이지
    @GetMapping("/DashBoardPage")
    public String DashBoard(HttpSession session,Model model) {

        String userId = (String)session.getAttribute("user");
        
        int ProblemSolvedCnt  = solvingService.ProblemSolvedCnt(userId);

        Academic userAcademic = academicService.finAcademic(userId);

        User user = userservice.findUserName(userId);

        

        model.addAttribute("userName", user.getUserName());
        model.addAttribute("loginCnt", user.getLoginCnt());
        model.addAttribute("ProblemSolvedCnt", ProblemSolvedCnt);
        model.addAttribute("userAcademic", userAcademic);
     

        return "DashBoard";
    }

    // 문제 탐험대 페이지 
    @GetMapping("/QuizMakerPage")
    public String QuizMakerPage() {





        return "QuizMaker";
    }

    // 문제 결과 페이지
    @GetMapping("/CheckAnswerPage")
    public String CheckAnswerPage(@RequestParam(value = "from", required = false) String from,HttpSession session, Model model){

        List<Map<String, Object>> questions = (List<Map<String, Object>>) session.getAttribute("questions");
        System.out.println(questions);
        model.addAttribute("from", from);
        model.addAttribute("questions", questions);
       


        return "CheckAnswer";
    }
    
    // 방금푼 문제, 목차별 문제 , 모든 문제 페이지
    @GetMapping("/ProblemSolvingPage")
    public String ProblemSolvingPage() {




        return "ProblemSolving";
    }
    
    

    
    
   
    


}
