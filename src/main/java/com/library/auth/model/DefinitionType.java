package com.library.auth.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "definition_types")
public class DefinitionType {

	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;
	 
	 
	 @NotBlank(message ="is required!!")
	 private String definitiontype;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getDefinitiontype() {
		return definitiontype;
	}


	public void setDefinitiontype(String definitiontype) {
		this.definitiontype = definitiontype;
	}

	 

	 
	 

}
