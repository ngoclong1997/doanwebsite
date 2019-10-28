package com.drato.graduationthesis.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class RoleDefineController {
    @RequestMapping("/role-define")
    public String index() {
        return "admin/role-define/index";
    }
}
