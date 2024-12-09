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


    Optional<Solving> findByUserIdAndQesIdxAndUploadIdx(String userId, Long qesIdx, Long uploadIdx);

    Optional<Solving> findByUserIdAndQesIdx(String userId, Long qesIdx);

    @Query("SELECT COUNT(s) FROM Solving s WHERE s.userId = :userId AND s.corrAnswerYn = 'Y'")
    int countCorrectAnswersByUserId(@Param("userId") String userId);


}
