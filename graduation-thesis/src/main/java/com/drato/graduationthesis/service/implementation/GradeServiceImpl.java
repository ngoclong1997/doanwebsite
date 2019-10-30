package com.drato.graduationthesis.service.implementation;

import com.drato.graduationthesis.model.Grade;
import com.drato.graduationthesis.repository.GradeRepository;
import com.drato.graduationthesis.service.interfaces.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    GradeRepository repository;

    @Override
    public List<Grade> getAll() {
        return null;
    }

    @Override
    public Grade getById() {
        return null;
    }

    @Override
    public void deleteByExamId(Long examId) {
        repository.deleteAllByExamId(examId);
    }
}
