package com.edububby.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QuestionCountDTO {


    private String qesType;
    private Long questionCount;

}
