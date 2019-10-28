package com.drato.graduationthesis.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class AnswerController {
    @RequestMapping("/answer")
    public String index() {
        return "manager/answer/index";
    }
}
