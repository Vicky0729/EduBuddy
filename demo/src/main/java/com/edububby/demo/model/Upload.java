package com.edububby.demo.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="tb_upload")
public class Upload{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="upload_idx")
    private Long uploadIdx;
    @Column(name="user_id")
    private String userId;
    @Column(name="upload_file")
    private String uploadFile;
    @Column(name="upload_dt")
    private LocalDateTime uploadDt;
    @Column(name="upload_text")
    private String uploadText;
    @Column(name="keyword1")
    private String keyword1;
    @Column(name="keyword2")
    private String keyword2;
    @Column(name="keyword3")
    private String keyword3;
    @Column(name="keyword4")
    private String keyword4;
    @Column(name="keyword5")
    private String keyword5;

    

}
