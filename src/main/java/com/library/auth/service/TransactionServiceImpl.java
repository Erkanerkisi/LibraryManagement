package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Member;
import com.library.auth.model.Transaction;
import com.library.auth.repository.TransactionRepository;

@Service
public class TransactionServiceImpl implements TransactionService {
	
	 @Autowired
	 private TransactionRepository transacitonRepository;



	@Override
	public void save(Transaction transaction) {
		
		transacitonRepository.save(transaction);

	}

	@Override
	public List<Transaction> getTransactions() {
		
		//System.out.println(transacitonRepository.findAll());
		return transacitonRepository.findAll();
	}

	
	public void delete(Long id) {
		transacitonRepository.delete(id);
		
	}

	@Override
	public Transaction getTransactionById(Long id) {
		
		return transacitonRepository.findOne(id);
	}
	
	@Override
	public List<Transaction> search(String name,String surname,String bookname,String tradate) {
		
		return transacitonRepository.findAllWithCriteria(name,surname,bookname,tradate);
		
		
	}

}
