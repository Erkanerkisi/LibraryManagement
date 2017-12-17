package com.library.auth.service;

import java.util.List;

import com.library.auth.model.Media;

public interface MediaService {

	public void save(Media media);

	public List<Media> getMedias();

}
