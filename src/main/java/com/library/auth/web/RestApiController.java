package com.library.auth.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.library.auth.model.Member;
import com.library.auth.service.MemberService;
import com.library.auth.util.CustomErrorType;


@RestController
@RequestMapping("/api")
public class RestApiController {

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	@Autowired
	MemberService memberService; //Service which will do all data retrieval/manipulation work

	// -------------------Retrieve All members---------------------------------------------

	@RequestMapping(value = "/member/", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> listAllMembers() {
		List<Member> members = memberService.getMembers();
		if (members.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<Member>>(members, HttpStatus.OK);
	}

	// -------------------Retrieve Single member------------------------------------------

	@RequestMapping(value = "/member/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> getmember(@PathVariable("id") long id) {
		logger.info("Fetching member with id {}", id);
		Member member = memberService.findById(id);
		if (member == null) {
			return new ResponseEntity(new CustomErrorType("member with id " + id 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Member>(member, HttpStatus.OK);
	}

	// -------------------Create a member-------------------------------------------

	@RequestMapping(value = "/member/", method = RequestMethod.POST)
	public ResponseEntity<?> createmember(@RequestBody Member member, UriComponentsBuilder ucBuilder) {
		System.out.println("Burdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		logger.info("Creatingg member : {}", member);

//		if (memberService.isMemberExist(member)) {
//			logger.error("Unable to create. A member with name {} already exist", member.getName());
//			return new ResponseEntity(new CustomErrorType("Unable to create. A member with name " + 
//			member.getName() + " already exist."),HttpStatus.CONFLICT);
//		}
		memberService.save(member);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/member/{id}").buildAndExpand(member.getId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	// ------------------- Update a member ------------------------------------------------

	@RequestMapping(value = "/member/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updatemember(@PathVariable("id") long id, @RequestBody Member member) {
		logger.info("Updating member with id {}", id);

		Member currentmember = memberService.findById(id);

		if (currentmember == null) {
			logger.error("Unable to update. member with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to upate. member with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}

		currentmember.setName(member.getName());

		memberService.updateUser(currentmember);
		return new ResponseEntity<Member>(currentmember, HttpStatus.OK);
	}

	// ------------------- Delete a member-----------------------------------------

	@RequestMapping(value = "/member/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deletemember(@PathVariable("id") long id) {
		logger.info("Fetching & Deleting member with id {}", id);

		Member member = memberService.findById(id);
		if (member == null) {
			logger.error("Unable to delete. member with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to delete. member with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		memberService.delete(id);
		return new ResponseEntity<Member>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Delete All members-----------------------------

	@RequestMapping(value = "/member/", method = RequestMethod.DELETE)
	public ResponseEntity<Member> deleteAllmembers() {
		logger.info("Deleting All members");

		memberService.deleteAllMembers();
		return new ResponseEntity<Member>(HttpStatus.NO_CONTENT);
	}

}