package com.library.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.library.auth.model.Media;

public interface MediaRepository   extends JpaRepository<Media, Long> {

}
