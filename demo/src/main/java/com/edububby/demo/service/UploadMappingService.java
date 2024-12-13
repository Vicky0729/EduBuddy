package com.edububby.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.UploadMapping;
import com.edububby.demo.repo.UploadMappingRepository;

@Service
public class UploadMappingService {

    @Autowired
    UploadMappingRepository repo;

    public void insertUploadMapping(List<Long> qesIdxs,Long uploadIdx){
       

        for (Object qesIdx : qesIdxs) {
            
            Long longValue = ((Number) qesIdx).longValue(); // Integer 또는 Long 처리
            
    
            boolean exists = repo.existsByQesIdxAndUploadIdx(longValue, uploadIdx);
            if (!exists) {
                UploadMapping uploadMapping = new UploadMapping();
                uploadMapping.setQesIdx(longValue);
                uploadMapping.setUploadIdx(uploadIdx);
                repo.save(uploadMapping);
            }
        }


        
    } 
    


}
