package com.library.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.library.auth.model.Transaction;

public interface TransactionRepository  extends JpaRepository<Transaction, Long> {
	
	@Query("select a from Transaction a,Book c,Member d where a.book.id = c.id and a.member.id = d.id "
			+ "and upper(d.name) like upper(CONCAT('%',?1,'%')) "
			+ "and upper(d.surname) like upper(CONCAT('%',?2,'%'))"
			+ "and upper(c.bookName) like upper(CONCAT('%',?3,'%')) "
			+ "and trunc(a.transactionDate) like CONCAT('%',?4,'%')")
List <Transaction> findAllWithCriteria(String name,String surname,String bookname, String tradate);


}
