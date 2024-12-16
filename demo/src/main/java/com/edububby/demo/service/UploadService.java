package com.edububby.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edububby.demo.model.Upload;
import com.edububby.demo.repo.UploadRepository;

@Service
public class UploadService {


        @Autowired
        UploadRepository repo;

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


       

}
