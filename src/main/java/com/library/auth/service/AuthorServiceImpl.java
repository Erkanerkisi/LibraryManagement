package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Author;
import com.library.auth.repository.AuthorRepository;

@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	private AuthorRepository authorRepository;



	@Override
	public void save(Author author) {
		
		authorRepository.save(author);

	}

	@Override
	public List<Author> getAuthors() {
		// TODO Auto-generated method stub
		return authorRepository.findAll();
	}

}
