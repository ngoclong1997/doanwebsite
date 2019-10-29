package com.drato.graduationthesis.repository;

import com.drato.graduationthesis.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
	Optional<User> findById(Long id);
	boolean existsByEmail(String email);
	boolean existsByUsername(String username);
}
