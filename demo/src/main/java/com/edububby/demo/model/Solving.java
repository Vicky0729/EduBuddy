package com.edububby.demo.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="tb_solving")
public class Solving {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="solving_idx")
    private Long solvingIdx;
    @Column(name="user_id")
    private String userId;
    @Column(name="qes_idx")
    private Long qesIdx;
    @Column(name="upload_idx")
    private Long uploadIdx;
    @Column(name="corr_answer_val")
    private int corrAnswerVal;
    @Column(name="corr_answer_text")
    private String corrAnswerText;
    @Column(name="sel_answer_val")
    private int selAnswerVal;
    @Column(name="sel_answer_text")
    private String selAnswerText;
    @Column(name="corr_answer_yn", nullable = false)
    private char corrAnswerYn;
    @Column(name="solving_dt")
    private LocalDateTime solvingDt;


    
    

}
