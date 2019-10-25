package net.javaguides.springboot.springsecurity.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import net.javaguides.springboot.springsecurity.model.User;
import net.javaguides.springboot.springsecurity.web.dto.UserRegistrationDto;

public interface UserService extends UserDetailsService {

    User findByUsername(String username);

    boolean emailExisted(String email);
    boolean usernameExisted(String username);

    User save(UserRegistrationDto registration);
}
