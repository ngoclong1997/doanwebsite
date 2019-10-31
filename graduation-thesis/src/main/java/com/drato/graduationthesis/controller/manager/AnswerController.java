package com.drato.graduationthesis.controller.manager;

import com.drato.graduationthesis.dto.ExamSubjectDto;
import com.drato.graduationthesis.model.Answer;
import com.drato.graduationthesis.model.Exam;
import com.drato.graduationthesis.model.Subject;
import com.drato.graduationthesis.service.interfaces.AnswerService;
import com.drato.graduationthesis.service.interfaces.ExamService;
import com.drato.graduationthesis.service.interfaces.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/manager")
public class AnswerController {

    @Autowired
    AnswerService answerService;

    @Autowired
    ExamService examService;

    @Autowired
    SubjectService subjectService;

    @GetMapping("/answer")
    public String index(Model model) {
        model.addAttribute("exams", examService.getAll());
        model.addAttribute("subjects", new ArrayList<Subject>());
        model.addAttribute("examSubjectDto", new ExamSubjectDto());
        model.addAttribute("title", "Danh sách đáp án");
        return "manager/answer/index";
    }

    @PostMapping("/answer")
    public String loadListAnswers(@ModelAttribute("examSubjectDto") @Valid ExamSubjectDto examSubjectDto, BindingResult result, Model model) {
        model.addAttribute("exams", examService.getAll());
        if (result.hasErrors()) {
            model.addAttribute("Danh sách đáp án");
            return "manager/answer/index";
        }
        Exam exam = examService.getById(Long.valueOf(examSubjectDto.getExamId()));
        model.addAttribute("subjects", exam.getSubjects());
        model.addAttribute("examSubjectDto", examSubjectDto);
        List<Answer> answers = answerService.getAllByExamAndSubject(Long.valueOf(examSubjectDto.getExamId()), Long.valueOf(examSubjectDto.getSubjectId()));
        model.addAttribute("answers", answers);
        model.addAttribute("title", "Danh sách đáp án");
        return "manager/answer/index";
    }

    @GetMapping("/answer/getExamSubjects")
    public ResponseEntity<?> getExamSubjects(@RequestParam("examId") Long examId) {

        try {
            Exam exam = examService.getById(examId);
            return ResponseEntity.ok(exam.getSubjects());
        } catch (Exception e) {
            return ResponseEntity.ok(new ArrayList<Subject>());
        }
    }
}
