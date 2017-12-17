package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Definition;
import com.library.auth.model.DefinitionType;
import com.library.auth.repository.DefinitionRepository;
import com.library.auth.repository.DefinitionTypeRepository;

@Service
public class DefinitionTypeServiceImpl implements DefinitionTypeService {
	
	@Autowired
    private DefinitionTypeRepository definitionTypeRepository;
	
	

	@Override
	public void save(DefinitionType definitiontype) {
		
		definitionTypeRepository.save(definitiontype);
		

	}

	@Override
	public List<DefinitionType> getDefinitionTypes() {

		return definitionTypeRepository.findAll();
	}

	public DefinitionType findBydefinitiontype(String definitiontype) {


		return definitionTypeRepository.findBydefinitiontype(definitiontype);
	}

}
