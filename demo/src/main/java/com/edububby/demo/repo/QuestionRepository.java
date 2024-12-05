package com.edububby.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.QuestionBank;


@Repository
public interface QuestionRepository extends JpaRepository<QuestionBank,Long>{


         @Query("SELECT q FROM QuestionBank q " +
           "JOIN UploadMapping u ON q.qesIdx = u.uploadMapping " +
           "WHERE u.uploadIdx = :uploadIdx AND q.qesLevel = :qesLevel")
        public List<QuestionBank> findQuestionsByUploadIdxAndLevel(Long uploadIdx, int qesLevel);



        @Query(value = """
          SELECT 
              qb.qes_type AS qesType, 
              COUNT(DISTINCT s.qes_idx) AS questionCount
          FROM 
              tb_solving s
          JOIN 
              tb_question_bank qb
          ON 
              s.qes_idx = qb.qes_idx
          WHERE 
              s.user_id = :userId
              AND (s.corr_answer_yn = 'N' OR s.solving_fav = 'Y')
          GROUP BY 
              qb.qes_type
          LIMIT 0, 1000
          """, nativeQuery = true)
      public List<Object[]> findQuestionCountByUserId(String userId);




}
