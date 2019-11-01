package com.drato.graduationthesis.dto;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class StudentFileUploadDto {
    @NotEmpty(message = "Trường này không được bỏ trống")
    private String examId;
    @NotNull(message = "Trường này không được bỏ trống")
    Boolean hasHeader;
    @NotNull(message = "Trường này không được bỏ trống")
    private MultipartFile file;

    public Boolean getHasHeader() {
        return hasHeader;
    }

    public void setHasHeader(Boolean hasHeader) {
        this.hasHeader = hasHeader;
    }

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
