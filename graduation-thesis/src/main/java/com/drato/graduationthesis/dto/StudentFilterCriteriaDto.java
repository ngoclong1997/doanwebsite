package com.drato.graduationthesis.dto;

import javax.validation.constraints.NotEmpty;

public class StudentFilterCriteriaDto {
    @NotEmpty(message = "Trường này không được bỏ trống")
    String examId;

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }
}
