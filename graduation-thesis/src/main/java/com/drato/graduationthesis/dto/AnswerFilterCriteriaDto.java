package com.drato.graduationthesis.dto;

import com.drato.graduationthesis.model.Exam;
import com.drato.graduationthesis.model.Subject;

import javax.validation.constraints.NotEmpty;

public class AnswerFilterCriteriaDto {
    @NotEmpty(message = "Trường này không được bỏ trống")
    String examId;
    @NotEmpty(message = "Trường này không được bỏ trống")
    String subjectId;

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }
}
