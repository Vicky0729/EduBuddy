package com.edububby.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;






@Controller
public class UserController {


    @GetMapping("/")
    public String Main() {


    
        return "login";
    }

    @GetMapping("/phonelogin")
    public String phoneLoginPage(){

        


        return "phonelogin";
    }

    @GetMapping("/join")
    public String joinPage() {



        return "join";
    }


    //회원가입 기능 구현
    @PostMapping("/joinUser")
    public String joinUser(){
        

    
        return "Idinfo";
    }

    //회원가입 기능 구현
    @GetMapping("/StudentInfo")
    public String StudentInfoPage() {
        return "StudentInfo";
    }
    
    
    


}
