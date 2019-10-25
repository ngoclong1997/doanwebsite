package net.javaguides.springboot.springsecurity.service;

import net.javaguides.springboot.springsecurity.model.Role;
import net.javaguides.springboot.springsecurity.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleRepository repository;

    @Override
    public Role getRoleByName(String roleName) {
        Role role;
        if (!roleNameExisted(roleName)) {
            role = repository.findByName(roleName);
        } else {
            role = new Role(roleName, "");
        }
        return role;
    }

    @Override
    public boolean roleNameExisted(String roleName) {
        return repository.existsByName(roleName);
    }
}
