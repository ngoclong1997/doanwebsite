package com.drato.graduationthesis.controller;

import com.drato.graduationthesis.dto.UserDto;
import com.drato.graduationthesis.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/registration")
public class UserRegistrationController {

    @Autowired
    private UserService userService;

    @ModelAttribute("user")
    public UserDto userRegistrationDto() {
        return new UserDto();
    }

    @GetMapping
    public String showRegistrationForm(Model model) {
        return "registration";
    }

    @PostMapping
    public String registerUserAccount(@ModelAttribute("user") @Valid UserDto userDto, BindingResult result){

        if (userService.emailExisted(userDto.getEmail())) {
            result.rejectValue("email", null, "Email đã tồn tại");
        }
        if (userService.usernameExisted(userDto.getUsername())) {
            result.rejectValue("username", null, "Tên đăng nhập đã tồn tại");
        }
        if (result.hasErrors()){
            return "registration";
        }
        userService.createUser(userDto);
        return "redirect:/registration?success";
    }

}
