package com.library.auth.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "definitions",uniqueConstraints = @UniqueConstraint(name="definition_uc",columnNames="definition"))
public class Definition {

	 @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;
	 
	 
	 
	 @NotBlank(message ="is required!!")
	 private String definition;
	 
	 @ManyToOne(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,
			 CascadeType.MERGE,
		   	 CascadeType.DETACH,
			 CascadeType.REFRESH})
	 @JoinColumn(name = "definitiontype")
	 @NotNull(message ="is required!!")
	 private DefinitionType deftype;
	 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDefinition() {
		return definition;
	}

	public void setDefinition(String definition) {
		this.definition = definition;
	}

	public DefinitionType getDeftype() {
		return deftype;
	}

	public void setDeftype(DefinitionType deftype) {
		this.deftype = deftype;
	}
	 
	 
	 
	 

	 
	 
}
