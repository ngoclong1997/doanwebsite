package com.drato.graduationthesis.controller.admin;

import com.drato.graduationthesis.service.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class RoleController {

    @Autowired
    RoleService roleService;

    @RequestMapping("/role")
    public String index(Model model) {
        model.addAttribute("title", "Danh sách quyền hệ thống");
        return "admin/role/index";
    }
}
