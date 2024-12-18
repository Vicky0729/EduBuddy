package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.Solving;

import java.util.List;
import java.util.Optional;


@Repository
public interface SolvingRepository extends JpaRepository<Solving,Long>{


    

    Optional<Solving> findByUserIdAndQesIdx(String userId, Long qesIdx);

    @Query("SELECT COUNT(ts) FROM Solving ts WHERE ts.userId = :userId") 
    int countByUserId(String userId);


        @Query("SELECT s.qesIdx " +
        "FROM Solving s " +
        "WHERE s.userId = :userId " +
        "ORDER BY s.wrongCnt DESC " +
        "LIMIT 1")
        Long findTopQesIdxByHighestWrongCnt(String userId);
    


}
