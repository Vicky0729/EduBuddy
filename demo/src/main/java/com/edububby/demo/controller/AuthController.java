package com.edububby.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.edububby.demo.model.User;
import com.edububby.demo.service.AuthService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class AuthController {
    
    @Autowired
    AuthService service;

    @PostMapping("/auth/login")
    public String login(User user, HttpSession session) {
        User loginUser = service.login(user);
        


        if(loginUser!=null){
            session.setAttribute("user", loginUser.getUserId());
        }
        
        return "redirect:/";
    }
    
}

