package com.drato.graduationthesis.service.implementation;

import com.drato.graduationthesis.dto.UserRegistrationDto;
import com.drato.graduationthesis.model.Role;
import com.drato.graduationthesis.model.User;
import com.drato.graduationthesis.repository.UserRepository;
import com.drato.graduationthesis.service.interfaces.RoleService;
import com.drato.graduationthesis.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleService roleService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public User findByUsername(String username){
        return userRepository.findByUsername(username);
    }

    @Override
    public boolean emailExisted(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean usernameExisted(String username) {
        return userRepository.existsByUsername(username);
    }

    public User createUser(UserRegistrationDto registration, String role){
        User user = new User();
        user.setUsername(registration.getUsername());
        user.setPassword(passwordEncoder.encode(registration.getPassword()));
        user.setFirstName(registration.getFirstName());
        user.setLastName(registration.getLastName());
        user.setEmail(registration.getEmail());
        user.setEnabled(true);

        user.setRoles(Collections.singletonList(roleService.getRoleByName(role)));
        return userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user;
        try {
            user = userRepository.findByUsername(username);
        } catch (Exception e) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles){
        return roles.stream()
                .map(role -> new SimpleGrantedAuthority(role.getName()))
                .collect(Collectors.toList());
    }
}
