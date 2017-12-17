package com.library.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.auth.model.Author;

public interface AuthorRepository extends JpaRepository<Author, Long> {

}
