package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.Academic;
import com.edububby.demo.repo.AcademicRepository;

@Service
public class AcademicService {
    
    @Autowired
    AcademicRepository repo;

    public void insertAcademic(Academic academic){

    repo.save(academic);
    }

    public Academic finAcademic(String UserId){

       return repo.findByUserId(UserId);
    }

    




}
