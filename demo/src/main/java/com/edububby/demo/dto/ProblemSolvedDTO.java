package com.edububby.demo.dto;


import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class ProblemSolvedDTO {


    private Long qesIdx;         // 문제 ID
    private String qesType;      // 문제 유형
    private String qesContent;   // 문제 내용
    private String qesAnswer;    // 정답
    private String qesDt;        // 등록일자
    private int qesLevel;        // 문제 난이도
    private String qesSel1;      // 선택지 1
    private String qesSel2;      // 선택지 2
    private String qesSel3;      // 선택지 3
    private String qesSel4;      // 선택지 4
    private String qesSel5;      // 선택지 5
    private String qesExp;       // 해설
    private String qesImg1;
    private String qesImg2;
    private Integer wrongCnt;    // 틀린 횟수
   


  




}
