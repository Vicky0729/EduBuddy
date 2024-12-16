package com.edububby.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.Upload;
import com.edububby.demo.repo.SolvingRepository;
import com.edububby.demo.repo.UploadMappingRepository;
import com.edububby.demo.repo.UploadRepository;

@Service
public class UploadService {


        @Autowired
        UploadRepository repo;

        @Autowired
        SolvingRepository solvingRepo;

        @Autowired
        UploadMappingRepository uploadMappingRepo;

        public List<Upload> allUploadByUserId(String userId){

            return repo.findByUserId(userId);
        }

        public void insertUpload(Upload upload){

            repo.save(upload);
        }

        public void editUploadFile(Long uploadIdx, String uploadFile){

            Upload entity = repo.findById(uploadIdx)
                .orElseThrow(() -> new IllegalArgumentException("해당 ID를 찾을 수 없습니다: " + uploadIdx));

                entity.setUploadFile(uploadFile);
                repo.save(entity);
        }

        public void deleteUploadFile(Long uploadIdx){

            repo.deleteById(uploadIdx);

        }


        public String KeywordInput(Long uploadIdx){

            Upload upload = repo.findByUploadIdx(uploadIdx);
            String keyword1 = upload.getKeyword1();
            String keyword2 = upload.getKeyword2();
            String keyword3 = upload.getKeyword3();
            String keyword4 = upload.getKeyword4();
            String keyword5 = upload.getKeyword5();
    
            String KeywordInput = keyword1 + " " + keyword2 + " " + keyword3 + " " + keyword4 + " " + keyword5;

            return KeywordInput;
        }

       

        public Upload findByUploadIdx(Long uploadIdx){

            return repo.findByUploadIdx(uploadIdx);
        }


        public Upload DashBoardKeywords(String userId){


            List<Long> idx = solvingRepo.findMaxWrongCntQesIdxByUserId(userId);

            Long qesIdx =idx.get(0);


            List<Long> uploadIdxList = uploadMappingRepo.findUploadIdxByQesIdx(qesIdx);

            if (uploadIdxList.isEmpty()) {
                throw new RuntimeException("No uploadIdx found for qesIdx: " + qesIdx);
            }
            Long uploadIdx = uploadIdxList.get(0); // 첫 번째 값 선택 (중복 고려)

            
            return repo.findByUploadIdx(uploadIdx);

        }


       

}
