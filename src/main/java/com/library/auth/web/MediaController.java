package com.library.auth.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.auth.model.Media;
import com.library.auth.service.MediaService;

@Controller
@RequestMapping(value = "/Media")
public class MediaController {

	@Autowired
	private MediaService mediaService;
	
	  @RequestMapping
	  public String welcome(Model model) {
	  	
	  	return "index";
	  }

	@RequestMapping(value = "/CreateMedia", method = RequestMethod.GET)
	public String CreateMedia(Model model) {
		model.addAttribute("media", new Media());
		List<Media> medias = mediaService.getMedias();

		model.addAttribute("medias", medias);
		return "mediaForm";
	}

	@RequestMapping(value = "/Savemedia", method = RequestMethod.POST)
	public String Savemedia(@Valid @ModelAttribute("media") Media theMedia, BindingResult bindingResult, Model model) {
	
		
		 if (bindingResult.hasErrors()) {
	            return "mediaForm";
	        }

		mediaService.save(theMedia);

		return "redirect:/Media/CreateMedia";
	}

	 
}
