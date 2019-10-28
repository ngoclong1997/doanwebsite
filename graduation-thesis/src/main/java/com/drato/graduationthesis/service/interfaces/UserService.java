package com.drato.graduationthesis.service.interfaces;

import com.drato.graduationthesis.dto.UserRegistrationDto;
import com.drato.graduationthesis.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUsername(String username);

    boolean emailExisted(String email);
    boolean usernameExisted(String username);

    User createUser(UserRegistrationDto registration, String role);
}
