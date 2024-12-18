package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.Academic;
import com.edububby.demo.repo.AcademicRepository;

@Service
public class AcademicService {
    
    @Autowired
    AcademicRepository repo;

    // 학력 저장 서비스 
    public void insertAcademic(Academic academic){

    repo.save(academic);
    
    }

    // 유저의 학력 정보 
    public Academic finAcademic(String UserId){

       return repo.findByUserId(UserId);
    }

    // 유저 학년 수정 서비스 
    public void updateAcademicType(String userId,String academicType){

       Academic academic =  repo.findByUserId(userId);

        academic.setAcademicType(academicType);

        repo.save(academic);

    }

    // 유저 학교 이름 수정 서비스
    public void updateSchoolName(String userId,String schoolName){


        Academic academic = repo.findByUserId(userId);

        academic.setSchoolName(schoolName);

        repo.save(academic);


    }




}
