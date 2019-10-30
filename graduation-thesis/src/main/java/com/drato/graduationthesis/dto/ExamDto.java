package com.drato.graduationthesis.dto;

import com.drato.graduationthesis.model.Exam;
import com.drato.graduationthesis.model.Subject;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class ExamDto {
    private Long id;

    @NotEmpty(message = "Trường này không được bỏ trống")
    @Size(max = 512, message = "Trường này không được dài quá 512 ký tự")
    private String name;

    @NotEmpty(message = "Trường này không được bỏ trống")
    private List<Subject> subjects;

    @NotEmpty(message = "Trường này không được bỏ trống")
    private String startDate;

    @Size(max = 1024, message = "Trường này không được dài quá 1024 ký tự")
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
