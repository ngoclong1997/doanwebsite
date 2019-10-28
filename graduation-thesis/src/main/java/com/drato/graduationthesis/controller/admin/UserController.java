package com.drato.graduationthesis.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class UserController {
    @RequestMapping("/user")
    public String index() {
        return "admin/user/index";
    }

    @RequestMapping("/user/add")
    public String addUser() {
        return "admin/user/user-form";
    }
}
