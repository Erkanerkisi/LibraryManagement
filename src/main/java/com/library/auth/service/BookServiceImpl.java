package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Book;
import com.library.auth.repository.BookRepository;

@Service
public class BookServiceImpl implements BookService {
	
	 @Autowired
	 private BookRepository bookRepository;

	public BookServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void save(Book book) {
	
		bookRepository.save(book);

	}

	@Override
	public List<Book> getBooks() {
		// TODO Auto-generated method stub
		return bookRepository.findAll();
	}

	@Override
	public Book getBookById(Long id) {
		// TODO Auto-generated method stub
		return bookRepository.findOne(id);
	}

	@Override
	public void delete(Long id) {
		 bookRepository.delete(id);
		
	}

}
