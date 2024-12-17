package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.User;
import com.edububby.demo.repo.UserRepository;

@Service
public class AuthService {
    
    @Autowired
    UserRepository repo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 로그인
    public User login(User user){

        User storedUser = repo.findByUserId(user.getUserId());
        
        if (storedUser != null && passwordEncoder.matches(user.getUserPw(), storedUser.getUserPw())) {
            return storedUser; // 비밀번호 일치 -> 로그인 성공
        } else {
            return null; // 로그인 실패
        }
    }

    // log_cnt 증가 쿼리 호출
    public void updateLogCount(String userId) {
       repo.incrementLogCount(userId); // Repository에 정의된 쿼리 호출
    }

    public int getLogCount(String userId) {
        return repo.findLogCountByUserId(userId);
    }

}
