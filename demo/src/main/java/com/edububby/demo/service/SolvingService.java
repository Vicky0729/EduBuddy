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

    public void insertSolving(Long uploadIdx, String userId, List<Map<String, Object>> questions) {

       
        for (Map<String, Object> question : questions) {

            Long questionId = Long.parseLong(question.get("qesIdx").toString());
            char qesFav = question.get("qesFav").toString().charAt(0);
            char corrAnswerYn = question.get("corrAnswerYn").toString().charAt(0);

            // SolvingEntity 생성 또는 업데이트
            Solving solving = repo.findByUserIdAndQesIdxAndUploadIdx(userId, questionId, uploadIdx)
                    .orElse(new Solving()); // 존재하지 않으면 새로운 엔티티 생성

            int wrongCnt = solving.getWrongCnt();
            
            if(corrAnswerYn != 'Y'){
                wrongCnt++;
            }

            // 기존 값이 없으면 새로 설정
            solving.setUploadIdx(uploadIdx);
            solving.setUserId(userId);
            solving.setQesIdx(questionId);
            solving.setCorrAnswerYn(corrAnswerYn);
            solving.setSolvingDt(LocalDateTime.now()); // 현재 시간 설정
            solving.setSolvingFav(qesFav);
            solving.setWrongCnt(wrongCnt);

            // Repository를 통해 DB에 저장 (insert 또는 update)
           repo.save(solving);
           
        }

       
     // 삽입된 데이터 수 반환
    }

    public void updateSolving(String userId,List<Map<String, Object>> questions){

        for (Map<String, Object> question : questions) {

            Long questionId = Long.parseLong(question.get("qesIdx").toString());
            char qesFav = question.get("qesFav").toString().charAt(0);
            char corrAnswerYn = question.get("corrAnswerYn").toString().charAt(0);

            Solving solving = repo.findByUserIdAndQesIdx(userId,questionId).orElse(new Solving());

            int wrongCnt = solving.getWrongCnt();

            if(corrAnswerYn != 'Y'){
                wrongCnt++;
            }

            solving.setCorrAnswerYn(corrAnswerYn);
            solving.setSolvingDt(LocalDateTime.now()); // 현재 시간 설정
            solving.setSolvingFav(qesFav);
            solving.setWrongCnt(wrongCnt);


            repo.save(solving);


        }


    }

    public int correctNumber(String userId){


        return repo.countCorrectAnswersByUserId(userId);
    }
    

}
