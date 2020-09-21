package com.ssm.service;

import com.ssm.entity.User;

public interface UserService {

	User login(String name,String password);
	
	User selectById(Integer id);
	
	int updateUser(User user);
}
