package com.library.auth.service;

import java.util.List;

import com.library.auth.model.Member;
import com.library.auth.model.Transaction;

public interface TransactionService {
	
	 public void save(Transaction transaction);
	 
	 public void delete(Long id);
	 
	 public List<Transaction> getTransactions();
	 
	 public Transaction getTransactionById(Long id);
	 
	 public List<Transaction> search(String name,String surname,String bookname, String tradate);


}
