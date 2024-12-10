package com.edububby.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tb_academic")
public class Academic {

    @Id
    @Column(name="academic_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long academicIdx;
    @Column(name="academic_type")
    private String academicType;
    @Column(name="school_name")
    private String schoolName;
    @Column(name="user_id")
    private String userId;

    // 모든 필드를 포함하는 생성자
    public Academic(String academicType, String schoolName, String userId) {
        this.academicType = academicType;
        this.schoolName = schoolName;
        this.userId = userId;
    }

}
