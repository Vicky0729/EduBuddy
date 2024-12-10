package com.edububby.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import com.edububby.demo.dto.QuestionCountDTO;
import com.edububby.demo.model.Upload;
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

    

    // 로그인 기능 구현
    

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

    @GetMapping("/ReviewPage")
    public String Review(HttpSession session,Model model) {

        String userId = (String)session.getAttribute("user");

        List<QuestionCountDTO> qesCountList = questionService.findQuestionCountWithQesIdxByUserId(userId);
        System.out.println(qesCountList);
        model.addAttribute("qesCountList", qesCountList);


        return "Review";
    }


    @GetMapping("/DashBoardPage")
    public String DashBoard(HttpSession session,Model model) {

        String userId = (String)session.getAttribute("user");
        
        int correctNumber  = solvingService.correctNumber(userId);

        model.addAttribute("correctNumber", correctNumber);



        return "DashBoard";
    }

    @GetMapping("/QuizMakerPage")
    public String QuizMakerPage() {





        return "QuizMaker";
    }
    @GetMapping("/CheckAnswerPage")
    public String CheckAnswerPage(@RequestParam(value = "from", required = false) String from,HttpSession session, Model model){

        List<Map<String, Object>> questions = (List<Map<String, Object>>) session.getAttribute("questions");
        model.addAttribute("from", from);
        model.addAttribute("questions", questions);
       


        return "CheckAnswer";
    }
    
    @GetMapping("/")
    public String Main() {


    
        return "login";
    }
    @GetMapping("/PhoneloginPage")
    public String phoneLoginPage(){

        


        return "phonelogin";
    }

    @GetMapping("/joinPage")
    public String joinPage() {



        return "join";
    }


    //회원가입 기능 구현
    @GetMapping("/IdinfoPage")
    public String joinUser(){
        

    
        return "Idinfo";
    }

    //회원가입 기능 구현
    @GetMapping("/StudentInfoPage")
    public String StudentInfoPage() {


        return "StudentInfo";
    }

    @GetMapping("/ProblemSolvingPage")
    public String ProblemSolvingPage() {




        return "ProblemSolving";
    }
    
    

    
    
   
    


}
