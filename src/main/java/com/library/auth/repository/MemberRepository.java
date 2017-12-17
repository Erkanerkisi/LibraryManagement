package com.library.auth.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.library.auth.model.Member;


public interface MemberRepository extends JpaRepository<Member, Long> {

	@Query("select n from Member n where upper(n.name) like upper(CONCAT('%',?1,'%')) "
								+ "and upper(n.surname) like upper(CONCAT('%',?2,'%'))"
								+ "and upper(n.emailAddress) like upper(CONCAT('%',?3,'%')) "
								+ "and trunc(n.dateOfBirth) like CONCAT('%',?4,'%')")
	List <Member> findAllWithCriteria(String name,String surname,String email, String date);
	
}
