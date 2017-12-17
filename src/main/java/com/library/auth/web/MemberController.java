package com.library.auth.web;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.auth.model.Member;
import com.library.auth.service.MemberService;

@Controller
@RequestMapping(value = "/Member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	  @RequestMapping
	  public String welcome(Model model) {
	  	
	  	return "index";
	  }

	@RequestMapping(value = "/Createmember", method = RequestMethod.GET)
	public String Createmember(Model model) {
		model.addAttribute("member", new Member());

		return "memberForm";
	}
	

	@RequestMapping(value = "/listOfMembers", method = RequestMethod.GET)
	public String listOfMembers(Model model) {

		List<Member> listofmembers = memberService.getMembers();
		model.addAttribute("members", listofmembers);

		return "listOfMembers";
	}

	@RequestMapping(value = "/Savemember", method = RequestMethod.POST)
	public String Savemember(@Valid @ModelAttribute("member") Member theMember, BindingResult bindingResult,
			Model model) {
		// userValidator.validate(userForm, bindingResult);
		System.out.println("AAAAAAAAAAAAAA" + theMember.getId());
		System.out.println("AAAAAAAAAAAAAA" + theMember.getName());
		System.out.println("AAAAAAAAAAAAAA" + theMember.getDateOfBirth());

		if (bindingResult.hasErrors()) {
			return "memberForm";
		}

		memberService.save(theMember);

		return "redirect:/Member/listOfMembers";
	}

	@RequestMapping(value = "/Searchmembers", method = RequestMethod.POST)
	public String Searchmembers(@RequestParam("name") String name, 
								@RequestParam("surname") String surname,
								@RequestParam("email") String email,
								@RequestParam("birthday") String birthday, Model model) {
		// userValidator.validate(userForm, bindingResult);

		List<Member> listofmembers = memberService.search(name,surname,email,birthday);
		model.addAttribute("members", listofmembers);

		return "listOfMembers";
	}

	@RequestMapping(value = "/Updatemember", method = RequestMethod.POST)
	public String Updatemember(@RequestParam("memberid") Long id, Model model) {
		// userValidator.validate(userForm, bindingResult);

		Member member = memberService.getMemberById(id);

		model.addAttribute("member", member);

		return "memberForm";
	}

	@RequestMapping(value = "/Deletemember", method = RequestMethod.POST)
	public String Deletemember(@RequestParam("memberid") Long id, Model model) {

		memberService.delete(id);
		// Yeni bir kayıt gönder

		model.addAttribute("Message", "Success");

		return "redirect:/Member/listOfMembers";
	}

}
