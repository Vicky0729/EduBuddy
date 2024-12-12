package com.edububby.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="tb_upload_mapping")
public class UploadMapping {
    
    @Id
    @Column(name="upmap_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long upMapIdx;
    @Column(name="upload_idx")
    private Long uploadIdx;
    @Column(name="qes_idx")
    private Long qesIdx;



}
