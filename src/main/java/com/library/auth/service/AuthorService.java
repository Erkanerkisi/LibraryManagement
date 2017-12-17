package com.library.auth.service;

import java.util.List;

import com.library.auth.model.Author;

public interface AuthorService {

	
	
	public void save(Author author);

	public List<Author> getAuthors();
	
	
}
