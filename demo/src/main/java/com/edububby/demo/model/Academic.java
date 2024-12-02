package com.edububby.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="tb_academic")
public class Academic {

    @Id
    @Column(name="academic_idx")
    private Long academicIdx;
    @Column(name="academic_type")
    private String academicType;
    @Column(name="school_name")
    private String schoolName;
    @Column(name="user_id")
    private String userId;



}
