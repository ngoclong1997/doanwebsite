package com.drato.graduationthesis.service.implementation;

import com.drato.graduationthesis.model.Role;
import com.drato.graduationthesis.repository.RoleRepository;
import com.drato.graduationthesis.service.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleRepository repository;

    @Override
    public List<Role> getAllRole() {
        return repository.findAll();
    }

    @Override
    public Role getRoleByName(String roleName) {
        Role role;
        if (roleNameExisted(roleName)) {
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
