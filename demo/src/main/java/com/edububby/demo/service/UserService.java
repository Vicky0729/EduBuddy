package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.User;
import com.edububby.demo.repo.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository repo;

    // 회원가입
    public void insertUser(User user){


        repo.save(user);
    }

    public boolean IdExist (String userId){
        return repo.existsByUserId(userId);
    }


}
