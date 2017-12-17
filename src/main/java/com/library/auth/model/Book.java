package com.library.auth.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "books")
public class Book {

	
	
	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;
	 
	 @NotBlank(message ="is required!!")
	 private String bookName;
	 
	 @ManyToOne(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,
			 CascadeType.MERGE,
		   	 CascadeType.DETACH,
			 CascadeType.REFRESH})
	 @JoinColumn(name = "author_id")
	 @NotNull(message ="is required!!")
	 private Author author;
	 
	 
	 @ManyToOne(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,
			 CascadeType.MERGE,
		   	 CascadeType.DETACH,
			 CascadeType.REFRESH})
	 @NotNull(message ="is required!!")
	 @JoinColumn(name = "book_type_id")
	 private Definition bookType;
	 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Definition getBookType() {
		return bookType;
	}

	public void setBookType(Definition bookType) {
		this.bookType = bookType;
	}


	
	
	
	
	

}
