package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.Solving;
import java.util.Optional;


@Repository
public interface SolvingRepository extends JpaRepository<Solving,Long>{


    

    Optional<Solving> findByUserIdAndQesIdx(String userId, Long qesIdx);

    @Query("SELECT COUNT(ts) FROM Solving ts WHERE ts.userId = :userId") 
    int countByUserId(String userId);


}
