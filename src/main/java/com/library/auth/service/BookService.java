package com.library.auth.service;

import java.util.List;

import com.library.auth.model.Author;
import com.library.auth.model.Book;

public interface BookService {

	public void save(Book book);

	public List<Book> getBooks();
	
	public Book getBookById(Long id);
	
	public void delete(Long id);

}
