package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.UploadMapping;

@Repository
public interface UploadMappingRepository extends JpaRepository<UploadMapping,Long>{

     @Query("SELECT COUNT(u) > 0 FROM UploadMapping u WHERE u.qesIdx = :qesIdx AND u.uploadIdx = :uploadIdx")
    boolean existsByQesIdxAndUploadIdx(@Param("qesIdx") Long qesIdx, @Param("uploadIdx") Long uploadIdx);

    
}
