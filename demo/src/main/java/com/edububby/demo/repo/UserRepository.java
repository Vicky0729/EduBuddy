package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.User;

import jakarta.transaction.Transactional;


@Repository
public interface UserRepository extends JpaRepository<User,String>{

    public User findByUserIdAndUserPw(String userId, String userPw);

    boolean existsByUserId(String userId);   

    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.loginCnt = u.loginCnt + 1 WHERE u.userId = :userId")
    void incrementLogCount(@Param("userId") String userId);

    @Query("SELECT u.loginCnt FROM User u WHERE u.userId = :userId")
    int findLogCountByUserId(@Param("userId") String userId);

}
