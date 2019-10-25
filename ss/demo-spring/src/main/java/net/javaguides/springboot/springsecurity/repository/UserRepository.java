package net.javaguides.springboot.springsecurity.repository;

import net.javaguides.springboot.springsecurity.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
	boolean existsByEmail(String email);
	boolean existsByUsername(String username);
}
