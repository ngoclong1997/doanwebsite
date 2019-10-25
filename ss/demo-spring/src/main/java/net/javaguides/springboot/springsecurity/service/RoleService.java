package net.javaguides.springboot.springsecurity.service;

import net.javaguides.springboot.springsecurity.model.Role;

public interface RoleService {
    Role getRoleByName(String roleName);
    boolean roleNameExisted(String roleName);
}
