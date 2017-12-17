package com.library.auth.service;

import java.util.List;

import com.library.auth.model.Definition;
import com.library.auth.model.DefinitionType;

public interface DefinitionService {
	
	
	
	
	
	public void save(Definition definition);

	public List<Definition> getDefinitions();
	
	public List<Definition> findBydeftype(DefinitionType deftype);
	
	public List<Definition> findBydefname(String deftype);

}
