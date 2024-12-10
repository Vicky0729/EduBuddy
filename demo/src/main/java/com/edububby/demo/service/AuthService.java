package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.User;
import com.edububby.demo.repo.UserRepository;

@Service
public class AuthService {
    
    @Autowired
    UserRepository repo;

    // 로그인
    public User login(User user){
        
        return repo.findByIdAndPassword(user.getUserId(), user.getUserPw());
    }


}
