package com.drato.graduationthesis.controller.manager;


import com.drato.graduationthesis.dto.ExamDto;
import com.drato.graduationthesis.model.Exam;
import com.drato.graduationthesis.service.interfaces.ExamService;
import com.drato.graduationthesis.service.interfaces.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;
import java.text.ParseException;

@Controller
@RequestMapping("/manager")
public class ExamController {
    @Autowired
    ExamService examService;

    @Autowired
    SubjectService subjectService;

    @GetMapping("/exam")
    public String index(Model model) {
        model.addAttribute("title", "Danh sách kỳ thi");
        model.addAttribute("exams", examService.getAll());
        return "manager/exam/index";
    }

    @GetMapping("/exam/add")
    public String addExam(Model model) {
        model.addAttribute("title", "Thêm kỳ thi");
        model.addAttribute("exam", new ExamDto());
        model.addAttribute("selectableSubjects", subjectService.getAll());
        return "manager/exam/add-exam";
    }

    @PostMapping("/exam/add")
    public String addExam(@ModelAttribute("exam") @Valid ExamDto exam, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()){
            model.addAttribute("selectableSubjects", subjectService.getAll());
            model.addAttribute("title", "Thêm kỳ thi");
            return "manager/exam/add-exam";
        }
        try {
            examService.createExam(exam);
        } catch (ParseException e) {
            model.addAttribute("selectableSubjects", subjectService.getAll());
            model.addAttribute("title", "Thêm kỳ thi");
            result.rejectValue("startDate", null, "Không xác định được ngày bắt đầu");
            return "manager/exam/add-exam";
        }
        redirectAttributes.addFlashAttribute("message", "Đã thêm thành công");
        return "redirect:/manager/exam";
    }

    @GetMapping("/exam/edit")
    public String editExam(Model model, @RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Exam exam = examService.getById(id);
        if (exam == null) {
            redirectAttributes.addFlashAttribute("message", "Kỳ thi không tìm thấy");
            return "redirect:/manager/exam";
        }
        model.addAttribute("exam", examService.convertExamToExamDto(exam));
        model.addAttribute("selectableSubjects", subjectService.getAll());
        model.addAttribute("title", "Sửa kỳ thi");
        return "manager/exam/edit-exam";
    }

    @PostMapping("/exam/edit")
    public String editUser(Model model, RedirectAttributes redirectAttributes, @ModelAttribute("exam") ExamDto examDto, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("title", "Sửa kỳ thi");
            model.addAttribute("selectableSubjects", subjectService.getAll());
            return "manager/exam/edit-exam";
        }
        try {
            examService.editExam(examDto);
        } catch (ParseException e) {
            model.addAttribute("selectableSubjects", subjectService.getAll());
            model.addAttribute("title", "Thêm kỳ thi");
            result.rejectValue("startDate", null, "Không xác định được ngày bắt đầu");
            return "manager/exam/add-exam";
        }
        redirectAttributes.addFlashAttribute("message", "Đã chỉnh sửa thành công");
        return "redirect:/manager/exam";
    }

    @GetMapping("/exam/delete")
    public String deleteUser(RedirectAttributes redirectAttributes, @RequestParam("id") Long id) {
        Exam exam = examService.getById(id);
        if (exam == null) {
            redirectAttributes.addFlashAttribute("message", "Kỳ thi không tìm thấy");
            return "redirect:/manager/exam";
        }
        examService.deleteExam(exam);
        redirectAttributes.addFlashAttribute("message", "Đã xóa kỳ thi thành công");
        return "redirect:/manager/exam";
    }

}
