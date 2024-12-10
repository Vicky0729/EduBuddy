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
        
        return repo.findByUserIdAndUserPw(user.getUserId(), user.getUserPw());
    }

    // log_cnt 증가 쿼리 호출
    public void updateLogCount(String userId) {
       repo.incrementLogCount(userId); // Repository에 정의된 쿼리 호출
    }

    public int getLogCount(String userId) {
        return repo.findLogCountByUserId(userId);
    }

}
