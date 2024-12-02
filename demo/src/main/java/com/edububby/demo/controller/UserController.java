package com.edububby.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.edububby.demo.model.User;
import org.springframework.web.bind.annotation.RequestParam;


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

    @PostMapping("/joinUser")
    public String joinUser(){
        

    
        return "Idinfo";
    }

    @GetMapping("/StudentInfo")
    public String StudentInfoPage() {
        return "StudentInfo";
    }
    



}
