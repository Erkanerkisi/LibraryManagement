package com.library.auth.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.auth.model.Definition;
import com.library.auth.service.DefinitionService;
import com.library.auth.service.DefinitionTypeService;

@Controller
@RequestMapping(value = "/Definitions")
public class DefinitionController {
	
	@Autowired
	private DefinitionService definitionService;
	
	@Autowired
	private DefinitionTypeService definitionTypeService;
	
	
	@RequestMapping(value = "/CreateDefinition", method = RequestMethod.GET)
    public String Createdefinition(Model model) {
		
        model.addAttribute("def", new Definition());
        model.addAttribute("deftypes", definitionTypeService.getDefinitionTypes());
        model.addAttribute("defs", definitionService.getDefinitions());
        
        return "definitionForm";
    }
	
	@RequestMapping(value = "/filterOnDate", method = RequestMethod.GET)
    public @ResponseBody List <Definition> filterByDate(Model model,@RequestParam("value1") String value1) {
		
		
		
		List<Definition> listofdefinitions = definitionService.findBydeftype(definitionTypeService.findBydefinitiontype(value1));
        model.addAttribute("defs",listofdefinitions);
		
        
        return listofdefinitions;
    }
	
	

	@RequestMapping(value = "/listOfDefinitions", method = RequestMethod.GET)
    public String listOfDefinitions(Model model) {

		List<Definition> listofdefinitions = definitionService.getDefinitions();
        model.addAttribute("def",listofdefinitions);

        return "listOfDefinitions";
    }
	
	
	@RequestMapping(value = "/Savedefinition", method = RequestMethod.POST)
    public String Savedefinition(@Valid @ModelAttribute("def") Definition theDefinition, BindingResult bindingResult, Model model) {
        //userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "definitionForm";
        }
        
        

        definitionService.save(theDefinition);

        return "redirect:/Definitions/CreateDefinition";
    }
	
	
	
	

}
