package com.edububby.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.QuestionBank;
import com.edububby.demo.repo.QuestionRepository;

@Service
public class QuestionService {

    @Autowired
    QuestionRepository repo;

    public List<QuestionBank> QuestionSubmit(Long uploadIdx, int qesLevel){

        
        return repo.findQuestionsByUploadIdxAndLevel(uploadIdx,qesLevel);

        
    }



}
