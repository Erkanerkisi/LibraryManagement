package com.library.auth.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Media")
public class Media {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Getter
	@Setter
	private Long id;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Long publisherId) {
		this.publisherId = publisherId;
	}

	public String getMediaStatus() {
		return mediaStatus;
	}

	public void setMediaStatus(String mediaStatus) {
		this.mediaStatus = mediaStatus;
	}

	public String getMediaBarcode() {
		return mediaBarcode;
	}

	public void setMediaBarcode(String mediaBarcode) {
		this.mediaBarcode = mediaBarcode;
	}

	public String getMediaName() {
		return mediaName;
	}

	public void setMediaName(String mediaName) {
		this.mediaName = mediaName;
	}

	public String getMediaExplanation() {
		return mediaExplanation;
	}

	public void setMediaExplanation(String mediaExplanation) {
		this.mediaExplanation = mediaExplanation;
	}
 
	@Getter
	@Setter
	private Long publisherId;
	 
	
	@NotBlank(message ="is required!!")
	@Getter
	@Setter
	private String mediaStatus;
	  
	@Getter
	@Setter
	private String mediaBarcode;
	
	@NotBlank(message ="is required!!")
	@Getter
	@Setter
	private String mediaName;
	
	@NotBlank(message ="is required!!")
	@Getter
	@Setter
	private String mediaExplanation;

}
