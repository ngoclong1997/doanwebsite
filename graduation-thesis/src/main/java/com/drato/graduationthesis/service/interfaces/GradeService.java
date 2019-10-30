package com.drato.graduationthesis.service.interfaces;

import com.drato.graduationthesis.model.Grade;

import java.util.List;

public interface GradeService {
    public List<Grade> getAll();
    public Grade getById();
    public void deleteByExamId(Long examId);
}
