package com.drato.graduationthesis.dto;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class AnswerFileUploadDto {
    @NotEmpty(message = "Trường này không được bỏ trống")
    private String examId;
    @NotEmpty(message = "Trường này không được bỏ trống")
    private String subjectId;
    @NotNull(message = "Trường này không được bỏ trống")
    private MultipartFile file;

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

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

}
