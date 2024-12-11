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
@Table(name="tb_question_bank")
public class QuestionBank {

    @Id
    @Column(name="qes_idx")
    private Long qesIdx;
    @Column(name="qes_type")
    private String qesType;
    @Column(name="qes_content")
    private String qesContent;
    @Column(name="qes_answer")
    private String qesAnswer;
    @Column(name="qes_dt")
    private String qesDt;
    @Column(name="qes_level")
    private int qesLevel;
    @Column(name="qes_sel1")
    private String qesSel1;
    @Column(name="qes_sel2")
    private String qesSel2;
    @Column(name="qes_sel3")
    private String qesSel3;
    @Column(name="qes_sel4")
    private String qesSel4;
    @Column(name="qes_sel5")
    private String qesSel5;
    @Column(name="qes_exp")
    private String qesExp;
    @Column(name="qes_img1")
    private String qesImg1;
    @Column(name="qes_img2")
    private String qesImg2;




}
