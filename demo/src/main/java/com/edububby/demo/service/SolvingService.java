package com.edububby.demo.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.Solving;
import com.edububby.demo.repo.SolvingRepository;

@Service
public class SolvingService {


    @Autowired
    SolvingRepository repo;

    public int insertSolving(Long uploadIdx,String userId,List<Map<String, Object>> questions){

        int insertCount = 0;
        System.out.println("service enter");
        
        System.out.println(questions);

        for (Map<String, Object> question : questions) {

            Long questionId = Long.parseLong(question.get("qesIdx").toString());
            int corrAnswerVal = Integer.parseInt(question.get("corrAnswerVal").toString());
            String corrAnswerText = question.get("corrAnswerText").toString();
            int selAnswerVal = Integer.parseInt(question.get("selAnswerVal").toString());
            String selAnswerText = question.get("selAnswerText").toString();

            // 정답 여부 판단
            boolean isCorrect = corrAnswerVal == selAnswerVal; 

            // SolvingEntity 생성
            Solving solving= new Solving();
            solving.setUploadIdx(uploadIdx);
            solving.setUserId(userId);
            solving.setQesIdx(questionId);
            solving.setCorrAnswerVal(corrAnswerVal);
            solving.setCorrAnswerText(corrAnswerText);
            solving.setSelAnswerVal(selAnswerVal);
            solving.setSelAnswerText(selAnswerText);
            solving.setCorrAnswerYn(isCorrect ? 'Y' : 'N');
            solving.setSolvingDt(LocalDateTime.now()); // 현재 시간 설정 (추가)

            // Repository를 통해 DB에 저장
            repo.save(solving);
            insertCount++;
        }

        return insertCount; // 삽입된 데이터 수 반환
    }



        
}






