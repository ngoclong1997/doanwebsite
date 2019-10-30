package com.drato.graduationthesis.service.interfaces;

import com.drato.graduationthesis.model.Answer;
import com.drato.graduationthesis.model.Role;

import java.util.List;

public interface AnswerService {
    public List<Answer> getAll();

    public Answer getById(Long id);

    public Answer getByExamCodeAndExamId(String examCode, Long examId);

    public List<Answer> getAllByExamId(Long examId);

    public void deleteByExamId(Long examId);

}
