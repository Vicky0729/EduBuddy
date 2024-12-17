package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.QuestionKeyword;


@Repository
public interface QuestionKeywordRepository extends JpaRepository<QuestionKeyword,Long>{


    public QuestionKeyword findByQesIdx(Long qesIdx);






    
}
