package com.drato.graduationthesis.service.implementation;

import com.drato.graduationthesis.model.Exam;
import com.drato.graduationthesis.model.Student;
import com.drato.graduationthesis.repository.StudentRepository;
import com.drato.graduationthesis.service.interfaces.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentRepository repository;

    @Override
    public List<Student> getAll() {
        return repository.findAll();
    }

    @Override
    public List<Student> getAllByExamId(Long examId) {
        return repository.findAllByExamId(examId);
    }

    @Override
    public Student getById(Long id) {
        Optional<Student> optionalUser = repository.findById(id);
        return optionalUser.orElse(null);
    }

    @Override
    public void deleteByExamId(Long examId) {
        repository.deleteAllByExamId(examId);
    }
}
