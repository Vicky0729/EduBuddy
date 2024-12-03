package com.edububby.demo.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.QuestionBank;


@Repository
public interface QuestionRepository extends JpaRepository<QuestionBank,Long>{


         @Query("SELECT q FROM QuestionBank q " +
           "JOIN UploadMapping u ON q.qesMapping = u.uploadMapping " +
           "WHERE u.uploadIdx = :uploadIdx AND q.qesLevel = :qesLevel")
        public List<QuestionBank> findQuestionsByUploadIdxAndLevel(Long uploadIdx, int qesLevel);




}
