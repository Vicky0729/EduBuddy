package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.Upload;


import java.util.List;


@Repository
public interface UploadRepository extends JpaRepository<Upload,Long>{


    public List<Upload> findByUserId(String userId);

    public Upload findByUploadIdx(Long uploadIdx);
}
