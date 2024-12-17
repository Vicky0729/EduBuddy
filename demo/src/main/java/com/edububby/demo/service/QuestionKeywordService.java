package com.edububby.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.QuestionKeyword;
import com.edububby.demo.repo.QuestionKeywordRepository;
import com.edububby.demo.repo.SolvingRepository;

@Service
public class QuestionKeywordService {
    

    @Autowired

    QuestionKeywordRepository repo;

    @Autowired

    SolvingRepository solvingRepo;



    public QuestionKeyword DashBoardKeyword(String userId){

        Long TopQesIdx = solvingRepo.findTopQesIdxByHighestWrongCnt(userId);

        return repo.findByQesIdx(TopQesIdx);
    }






}
