package com.drato.graduationthesis.controller.admin;

import com.drato.graduationthesis.dto.UserDto;
import com.drato.graduationthesis.model.User;
import com.drato.graduationthesis.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserController {

    @Autowired
    UserService userService;



    @GetMapping("/user")
    public String index(Model model) {
        model.addAttribute("title", "Danh sách người dùng");
        model.addAttribute("users", userService.getAllUser());
        return "admin/user/index";
    }

    @GetMapping("/user/add")
    public String addUser(Model model) {
        model.addAttribute("title", "Thêm người dùng");
        model.addAttribute("user", new UserDto());
        return "admin/user/add-user";
    }

    @PostMapping("/user/add")
    public String addUser(Model model, @ModelAttribute("user") @Valid UserDto userDto, BindingResult result) {
        if (userService.emailExisted(userDto.getEmail())) {
            result.rejectValue("email", null, "Email đã tồn tại");
        }
        if (userService.usernameExisted(userDto.getUsername())) {
            result.rejectValue("username", null, "Tên đăng nhập đã tồn tại");
        }
        if (result.hasErrors()){
            model.addAttribute("title", "Thêm người dùng");
            return "admin/user/add-user";
        }
        userService.createUser(userDto, "ROLE_USER");
        return "admin/user/add-user?success";
    }

    @GetMapping("/user/edit")
    public String editUser(Model model, @RequestParam("id") Long id) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("title", "Sửa người dùng");
        return "admin/user/edit-user";
    }
}
