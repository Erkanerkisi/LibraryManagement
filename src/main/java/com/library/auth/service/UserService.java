package com.library.auth.service;

import java.util.List;

import com.library.auth.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    

	
	
	
}
