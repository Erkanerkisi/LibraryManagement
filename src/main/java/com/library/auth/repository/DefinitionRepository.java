package com.library.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.auth.model.Definition;
import com.library.auth.model.DefinitionType;
import com.library.auth.model.User;


public interface DefinitionRepository extends JpaRepository<Definition, Long> {

	List <Definition> findBydeftype (DefinitionType deftype);
	

	
}
