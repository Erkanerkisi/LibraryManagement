package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.library.auth.model.Definition;
import com.library.auth.model.DefinitionType;
import com.library.auth.repository.DefinitionRepository;
import com.library.auth.repository.DefinitionTypeRepository;

@Service
public class DefinitionServiceImpl implements DefinitionService {
	
	@Autowired
    private DefinitionRepository definitionRepository;
	
	@Autowired
    private DefinitionTypeRepository definitionTypeRepository;
	

	@Override
	public void save(Definition definition) {
		
		definitionRepository.save(definition);
		

	}

	@Override
	public List<Definition> getDefinitions() {

		return definitionRepository.findAll(new Sort(Sort.Direction.ASC, "deftype"));
	}


	//Burda definition tablosunu def type parametresi ile almak için
	@Override
	public List<Definition> findBydeftype(DefinitionType deftype) {
		// TODO Auto-generated method stub
		return  definitionRepository.findBydeftype(deftype);
	}
	
	//Burda direk type tablosundan hard code definition type vererek definition tablosundaki kayıtları alıyor.
	@Override
	public List<Definition> findBydefname(String deftype) {
		// TODO Auto-generated method stub
		return definitionRepository.findBydeftype(definitionTypeRepository.findBydefinitiontype(deftype));

	}

}
