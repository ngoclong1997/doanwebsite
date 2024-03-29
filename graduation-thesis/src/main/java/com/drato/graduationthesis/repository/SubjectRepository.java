package com.drato.graduationthesis.repository;

import com.drato.graduationthesis.model.Student;
import com.drato.graduationthesis.model.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    Subject findByName(String name);
    boolean existsByName(String name);
}
