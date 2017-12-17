package com.library.auth.service;

import java.util.Date;
import java.util.List;

import com.library.auth.model.Member;

public interface MemberService {
	
	 public void save(Member member);
	 
	 public List<Member> search(String name,String surname,String email, String birthdate);
	 
	 public void delete(Long id);
	 
	 public	void updateUser(Member member);
	 
	 public List<Member> getMembers();
	 
	 public Member getMemberById(Long id);
	 
	 public	Member findById(Long id);
	 
     boolean isMemberExist(Member member);
 	 public Member findByName(String name);
 	 
 	void deleteAllMembers();


}
