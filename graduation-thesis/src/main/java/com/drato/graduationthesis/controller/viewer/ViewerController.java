package com.drato.graduationthesis.controller.viewer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/viewer")
public class ViewerController {
    @RequestMapping({"/", ""})
    public String index(Model model) {
        model.addAttribute("title", "Xem thống kê");
        return "viewer/chart/index";
    }
}
