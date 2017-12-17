package com.library.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.auth.model.Book;

public interface BookRepository  extends JpaRepository<Book, Long> {

}
