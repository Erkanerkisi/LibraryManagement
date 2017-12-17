package com.library.auth.model;
import java.util.Date;

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

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "book_transactions")
public class Transaction {

	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;
	 
	 
	 @ManyToOne(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,
			 CascadeType.MERGE,
		   	 CascadeType.DETACH,
			 CascadeType.REFRESH})
	 @JoinColumn(name = "book_id")
	 @NotNull(message="Please enter a Book")
	 private Book book;
	 
	 
	 @ManyToOne(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,
			 CascadeType.MERGE,
		   	 CascadeType.DETACH,
			 CascadeType.REFRESH})
	 @JoinColumn(name = "member_id")
	 @NotNull(message="Please enter a Member")
	 private Member member;
	 
	 

	 
	 @NotNull(message="Please enter a date")
	 @DateTimeFormat(pattern="dd/MM/yyyy")
	 @Column(name = "transaction_date")
	 private Date transactionDate;
	 
	 @NotNull(message="Please enter a date")
	 @DateTimeFormat(pattern="dd/MM/yyyy")
	 @Column(name = "due_date")
	 private Date dueDate;

	 
	 @DateTimeFormat(pattern="dd/MM/yyyy")
	 @Column(name = "return_date")
	 private Date returnDate;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}



	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	public Date getTransactionDate() {
		return transactionDate;
	}


	public void setTransactionDate(Date transactionDate)  {
		this.transactionDate = transactionDate;
	}


	public Date getDueDate() {
		return dueDate;
	}


	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}


	public Date getReturnDate() {
		return returnDate;
	}


	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	 
	 
	 
	 
	 
	 
}

