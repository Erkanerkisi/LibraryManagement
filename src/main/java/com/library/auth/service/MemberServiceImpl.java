package com.library.auth.service;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Member;
import com.library.auth.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	 @Autowired
	 private MemberRepository memberRepository;
	 
	



	@Override
	public void save(Member member) {
		
		memberRepository.save(member);
		
	}

	@Override
	public List<Member> getMembers() {
		
		System.out.println(memberRepository.findAll());
		return memberRepository.findAll();
	}

	
	public Member getMemberById(Long id) {
		// TODO Auto-generated method stub
		 return memberRepository.findOne(id);
	}

	@Override
	public void delete(Long id) {
		
		memberRepository.delete(id);
		
	}

	@Override
	public List<Member> search(String name,String surname,String email,String birthdate) {
		
		
		return memberRepository.findAllWithCriteria(name,surname,email,birthdate);
		
		
	}

	@Override
	public Member findById(Long id) {
		// TODO Auto-generated method stub
	 return memberRepository.findOne(id);
	}
	

	@Override
	public boolean isMemberExist(Member member) {
		
		
		return findByName(member.getName()) != null;
	}

	@Override
	public Member findByName(String name) {
		// TODO Auto-generated method stub
		return findByName(name);
	}

	
	public void updateUser(Member member){
		save(member);
	}

	@Override
	public void deleteAllMembers() {
		memberRepository.deleteAll();
		
	}
	
	

}
