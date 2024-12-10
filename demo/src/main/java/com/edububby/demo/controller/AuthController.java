package com.edububby.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.edububby.demo.model.User;
import com.edububby.demo.service.AuthService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class AuthController {
    
    @Autowired
    AuthService service;

    @PostMapping("/auth/login")
    public String login(User user, HttpSession session, RedirectAttributes redirectAttributes) {
        System.out.println("로그인 시도: 사용자 ID = " + user.getUserId());
       
        User loginUser = service.login(user);
        

        if (loginUser != null) {
            System.out.println("로그인 성공: 로그인한 사용자 ID = " + loginUser.getUserId());
            session.setAttribute("user", loginUser.getUserId());

           // log_cnt 증가
            service.updateLogCount(loginUser.getUserId());

           // 업데이트된 login_cnt 다시 조회
            int updatedLogCount = service.getLogCount(loginUser.getUserId()); // 새로운 log_cnt 값 조회
            System.out.println("현재 login_cnt 값: " + updatedLogCount);

            return "redirect:/HomePage";

        } else {
            System.out.println("로그인 실패: 잘못된 사용자 ID 또는 비밀번호");
            redirectAttributes.addFlashAttribute("loginError", "회원정보가 일치하지 않습니다.");
            return "redirect:/PhoneloginPage";
        }
       
    }
    
}

