package com.drato.graduationthesis.service.interfaces;

import com.drato.graduationthesis.model.Role;

public interface RoleService {
    Role getRoleByName(String roleName);
    boolean roleNameExisted(String roleName);
}
