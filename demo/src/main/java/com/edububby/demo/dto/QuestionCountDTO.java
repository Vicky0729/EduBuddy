package com.edububby.demo.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QuestionCountDTO {


    private String qesType;
    private Long questionCount;
    private List<String> qesIdxList; // 문제 ID 리스트

}
