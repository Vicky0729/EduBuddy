package com.edububby.demo.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.dto.ProblemSolvedDTO;
import com.edububby.demo.dto.QuestionCountDTO;
import com.edububby.demo.model.QuestionBank;
import com.edububby.demo.repo.QuestionRepository;

@Service
public class QuestionService {

    @Autowired
    QuestionRepository repo;

 


    public List<QuestionCountDTO> findQuestionCountWithQesIdxByUserId(String userId) {
      

        // Object[] 결과를 DTO로 변환
        List<Object[]> results = repo.findQuestionCountWithQesIdxByUserId(userId);

        return results.stream().map(result -> new QuestionCountDTO((String) result[0],((Number) result[1]).longValue(),Arrays.asList(((String) result[2]).split(",")) )).collect(Collectors.toList());

    }

    public List<ProblemSolvedDTO> ProblemSolved(List<Long> qesIdxList, String userId){

        return repo.ProblemSolved(qesIdxList, userId);

    }

 


    public  List<ProblemSolvedDTO> AllProblem(String userId){

        return repo.findProblemsByUserId(userId);

    }
    
    public List<QuestionBank> UploadProblem(List<Long> qesIdxs){

        return repo.findByQesIdxIn(qesIdxs);

    }

    



}
