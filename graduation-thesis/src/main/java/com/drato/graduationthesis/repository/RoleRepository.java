package com.drato.graduationthesis.repository;

import com.drato.graduationthesis.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    public Role findByName(String name);
    public boolean existsByName(String name);
}
