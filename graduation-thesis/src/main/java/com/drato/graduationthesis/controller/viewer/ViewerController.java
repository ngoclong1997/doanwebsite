package com.drato.graduationthesis.controller.viewer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/viewer")
public class ViewerController {
    @RequestMapping({"/", ""})
    public String index() {
        return "viewer/index";
    }
}
