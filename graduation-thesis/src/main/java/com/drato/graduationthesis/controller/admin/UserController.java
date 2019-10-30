package com.drato.graduationthesis.controller.admin;

import com.drato.graduationthesis.dto.UserDto;
import com.drato.graduationthesis.model.User;
import com.drato.graduationthesis.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

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
    public String addUser(@ModelAttribute("user") @Valid UserDto userDto, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
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
        userService.createUser(userDto);
        redirectAttributes.addFlashAttribute("message", "Đã thêm thành công");
        return "redirect:/admin/user/add";
    }

    @GetMapping("/user/edit")
    public String editUser(Model model, @RequestParam("id") Long id) {
        User user = userService.findById(id);
        if (user == null) {
            model.addAttribute("message", "User không tìm thấy");
            return "redirect:/admin/user";
        }
        model.addAttribute("user", user);
        model.addAttribute("title", "Sửa người dùng");
        return "admin/user/edit-user";
    }

    @PostMapping("/user/edit")
    public String editUser(Model model, RedirectAttributes redirectAttributes, @ModelAttribute("user") User user, BindingResult result) {
        if (userService.emailUsedByOther(user.getId(), user.getEmail())) {
            result.rejectValue("email", null, "Email đã tồn tại");
        }
        if (userService.usernameUsedByOther(user.getId(), user.getUsername())) {
            result.rejectValue("username", null, "Tên đăng nhập đã tồn tại");
        }
        if (result.hasErrors()){
            model.addAttribute("title", "Sửa người dùng");
            return "admin/user/edit-user";
        }
        User updUser = userService.findById(user.getId());
        updUser.setEmail(user.getEmail());
        updUser.setFirstName(user.getFirstName());
        updUser.setLastName(user.getLastName());
        updUser.setUsername(user.getUsername());
        userService.editUser(updUser);
        redirectAttributes.addFlashAttribute("message", "Đã chỉnh sửa thành công");
        return "redirect:/admin/user";
    }

    @GetMapping("/user/delete")
    public String deleteUser(RedirectAttributes redirectAttributes, @RequestParam("id") Long id) {
        User user = userService.findById(id);
        if (user == null) {
            redirectAttributes.addFlashAttribute("message", "User không tìm thấy");
            return "redirect:/admin/user";
        }
        userService.deleteUser(user);
        redirectAttributes.addFlashAttribute("message", "Đã xóa người dùng thành công");
        return "redirect:/admin/user";
    }
}
