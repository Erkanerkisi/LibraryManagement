package com.library.auth.model;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "member_info")
public class Member {

	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;
	 
	 @NotBlank(message ="is required!!")
	 private String name;
	 
	 @NotBlank(message ="is required!!")
	 private String surname;
	 
	 @NotBlank(message ="is required!!")
	 @Email(message ="Enter correct email format")
	 private String emailAddress;
	 
	 //@NotNull(message="Please enter a date")
	 //@DateTimeFormat(pattern="dd/MM/yyyy")
	 private Date dateOfBirth;
	 
	 private boolean activeFlag;
	 

	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public boolean isActiveFlag() {
		return activeFlag;
	}
	public void setActiveFlag(boolean activeFlag) {
		this.activeFlag = activeFlag;
	}
	 
	 
	 
	 
}
