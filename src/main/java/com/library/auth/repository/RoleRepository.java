package com.library.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.auth.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
