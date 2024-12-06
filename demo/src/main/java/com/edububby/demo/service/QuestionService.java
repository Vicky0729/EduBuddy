package com.edububby.demo.service;

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

    public List<QuestionBank> QuestionSubmit(Long uploadIdx, int qesLevel){

        
        return repo.findQuestionsByUploadIdxAndLevel(uploadIdx,qesLevel);

        
    }


    public List<QuestionCountDTO> getQuestionCountsByUserId(String userId) {
        List<Object[]> results = repo.findQuestionCountByUserId(userId);

        // Object[] 결과를 DTO로 변환
        return results.stream().map(result ->new QuestionCountDTO((String) result[0], ((Number) result[1]).longValue())).collect(Collectors.toList());
    }




    public List<ProblemSolvedDTO> ProblemSolved(List<Long> qesIdxList, String userId){

        return repo.ProblemSolved(qesIdxList, userId);
    }





}
