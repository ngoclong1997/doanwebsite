package com.drato.graduationthesis.controller.manager;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ExamController {
    @RequestMapping("/exam")
    public String index() {
        return "manager/exam/index";
    }
}
