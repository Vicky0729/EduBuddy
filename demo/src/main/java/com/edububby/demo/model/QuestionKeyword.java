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

@Entity
@Data
@Table(name="tb_question_keyword")
public class QuestionKeyword {

    @Id
    @Column(name="qes_keyword_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long qesKeywordIdx;
    @Column(name="qes_idx")
    private Long qesIdx;
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
