package com.drato.graduationthesis.repository;

import com.drato.graduationthesis.model.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GradeRepository extends JpaRepository<Grade, Long> {
    public void deleteAllByExamId(Long examId);
}