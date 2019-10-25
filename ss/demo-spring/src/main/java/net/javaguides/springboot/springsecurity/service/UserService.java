package net.javaguides.springboot.springsecurity.service;

import net.javaguides.springboot.springsecurity.model.User;
import net.javaguides.springboot.springsecurity.web.dto.UserRegistrationDto;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUsername(String username);

    boolean emailExisted(String email);
    boolean usernameExisted(String username);

    User createUser(UserRegistrationDto registration, String role);
}
