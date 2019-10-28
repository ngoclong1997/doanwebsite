package com.drato.graduationthesis.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class ProfileController {
    @RequestMapping("/profile")
    public String index() {
        return "user/profile";
    }
}
