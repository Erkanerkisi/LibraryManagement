package com.library.auth.service;

import java.util.List;

import com.library.auth.model.DefinitionType;

public interface DefinitionTypeService {
	

	public void save(DefinitionType definitiontype);

	public List<DefinitionType> getDefinitionTypes();
	
	DefinitionType findBydefinitiontype(String definitiontype);

}
