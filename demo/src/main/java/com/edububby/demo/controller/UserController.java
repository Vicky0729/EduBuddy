package com.edububby.demo.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edububby.demo.model.Academic;
import com.edububby.demo.model.User;
import com.edububby.demo.service.AcademicService;
import com.edububby.demo.service.UserService;

import jakarta.servlet.http.HttpSession;





@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    AcademicService academicService;

// 회원가입
@PostMapping("/joinUser")
public String joinUser(User user, RedirectAttributes redirectAttributes){

    userService.insertUser(user);
    String userId = user.getUserId();
    redirectAttributes.addFlashAttribute("userId", userId);

    return "redirect:/StudentInfoPage";
}

// 아이디중복체크
@PostMapping("/UserInfo")
public String UserInfo(Academic academic){

    academicService.insertAcademic(academic);

    return "redirect:/PhoneloginPage";
}

}

