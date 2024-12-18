package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.User;
import com.edububby.demo.repo.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository repo;


    @Autowired
    private PasswordEncoder passwordEncoder;
    // 회원가입
    public void insertUser(User user){


        String encodedPassword = passwordEncoder.encode(user.getUserPw());
        user.setUserPw(encodedPassword);
    
        // 데이터베이스에 저장
        repo.save(user);
        
    }

    public boolean IdExist (String userId){
        return repo.existsByUserId(userId);
    }


    public User findUserName(String userId){

        return repo.findByUserId(userId);
    }

    public void updateUserName(String userId, String userName){

        User user = repo.findByUserId(userId);

        user.setUserName(userName);

        repo.save(user);

    }

}
