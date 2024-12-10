package com.edububby.demo.model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tb_user")
public class User {

    @Id
    @Column(name = "user_id") // 컬럼 이름 명시
    private String userId;
    @Column(name = "user_pw")
    private String userPw;
    @Column(name = "user_name")
    private String userName;
    @Column(name = "user_phone")
    private String userPhone;
    @Column(name = "user_birthdate")
    private String userBirthdate;
    @Column(name = "user_src")
    private String loginSrc;
    @Column(name = "join_dt")
    @CreationTimestamp
    private LocalDateTime joinDt;
    @Column(name = "login_cnt")
    private int loginCnt;

     // 모든 필드를 포함하는 생성자
     public User(String userId, String userPw, String userName, String userPhone, String userBirthdate) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userPhone = userPhone;
        this.userBirthdate = userBirthdate;
        this.joinDt = LocalDateTime.now();
    }




}
