package com.drato.graduationthesis.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class RoleController {
    @RequestMapping("/role")
    public String index() {
        return "admin/role/index";
    }
}
