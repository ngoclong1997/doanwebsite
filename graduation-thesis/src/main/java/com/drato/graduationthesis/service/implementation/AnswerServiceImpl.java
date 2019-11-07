package com.drato.graduationthesis.service.implementation;

import com.drato.graduationthesis.model.Answer;
import com.drato.graduationthesis.model.Role;
import com.drato.graduationthesis.repository.AnswerRepository;
import com.drato.graduationthesis.service.interfaces.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    AnswerRepository repository;

    @Override
    public List<Answer> getAll() {
        return repository.findAll();
    }

    @Override
    public Answer getById(Long id) {
        Optional<Answer> optionalUser = repository.findById(id);
        return optionalUser.orElse(null);
    }

    @Override
    public List<Answer> getAllByExamId(Long examId) {
        return repository.findAllByExamId(examId);
    }

    @Override
    public List<Answer> getAllByExamAndSubject(Long examId, Long subjectId) {
        return repository.findAllByExamIdAndSubjectId(examId, subjectId);
    }

    @Override
    public void deleteByExamId(Long examId) {
        repository.deleteAllByExamId(examId);
    }

    @Override
    public void insertAnswers(List<Answer> answers) {
        repository.deleteAllByExamIdAndSubjectId(answers.get(0).getExamId(), answers.get(0).getSubjectId());
        repository.saveAll(answers);
    }
}
