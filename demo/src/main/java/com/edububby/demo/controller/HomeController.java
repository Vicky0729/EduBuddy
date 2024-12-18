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
import com.edububby.demo.model.QuestionKeyword;
import com.edububby.demo.model.Upload;
import com.edububby.demo.model.User;
import com.edububby.demo.service.AcademicService;
import com.edububby.demo.service.QuestionKeywordService;
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
    
    @Autowired
    QuestionKeywordService QKService;

    
     // 첫페이지
     @GetMapping("/")
     public String Main() {
 
        System.out.println("오늘 에랏토스테네서 가 생간낸 지구크기 책정을 배우 볼거야. 에라토네스는 지구에 햇빛이 평해늘거 오고, 지구는 완전한 규혱이다 이거 생각하며 크기를 책정했다. 시애네와 알렉산드리아 거리 제기고, 빛이 막다로 각을 만둘면서 호 길이고 중심확이 알은서 지구 둘레를 계산. 지구 둘래를 책정할려고 중심각이랑 호 거리가 필요해서 원 중심이 360이다 참고 하서 계산했다. 근데 에라토테스가 한 계산은 완전하지 않다. 빛이 평해늘고 구형이라건 가정이 틀림해서 그거 때문.");
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("오늘은 에라토스테네스가 생각해낸 지구의 크기를 측정하는 방법을 배워보겠습니다. 에라토스테네스는 지구로 들어오는 햇빛은 평행하다, 지구는 완전한 구형이다. 라는 가정을 세우고 지구의 크기를 구하기 위한 방법을 생각해냈습니다. 에라토스테네스는 시엔에와 알렉산드리아의 거리를 측정하고 평행하게 들어오는 빛이 막대와 이룬는 각을 이용하여 호의 길이와. 중심각을 알아냈습니다. 지구의 크기 둘레를 구하기 위해서 중심각과 호의 길이가 필요한다는 점을 이용하여 원의 중심각이 360도인 점을 참고하여 지구의 둘레의 길이를 알아내었습니다. 이 측정은 지구, 둘레 길이뿐만 아니라 지구 반지름도 계산할 수 있습니다. 하지만 에라토스테네스의 이러한 계산 결과는 완전하지는 않았는데요. 그 이유는 에라토스테네스가 가정한 빛이 평행하게 들어온다 와 완절한 구형이다. 라는 가정이 잘못되었기 때문입니다.");
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

        QuestionKeyword Qkkeyword =  QKService.DashBoardKeyword(userId);

        System.out.println(Qkkeyword);
        
        model.addAttribute("Qkkeyword", Qkkeyword);
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
