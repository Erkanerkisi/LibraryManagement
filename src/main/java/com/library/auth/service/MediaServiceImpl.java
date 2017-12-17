package com.library.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.auth.model.Media;
import com.library.auth.repository.MediaRepository;

@Service
public class MediaServiceImpl implements MediaService {
	
	 @Autowired
	 private MediaRepository mediaRepository;

	public MediaServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void save(Media media) {
	
		mediaRepository.save(media);

	}

	@Override
	public List<Media> getMedias() {
		// TODO Auto-generated method stub
		return mediaRepository.findAll();
	}

}
