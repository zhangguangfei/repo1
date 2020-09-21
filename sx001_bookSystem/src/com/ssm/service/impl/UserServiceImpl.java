package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.UserMapper;
import com.ssm.entity.User;
import com.ssm.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper uMapper;

	@Override
	public User login(String name, String password) {
		return uMapper.login(name, password);
	}

	@Override
	public User selectById(Integer id) {
		return uMapper.selectById(id);
	}

	@Transactional
	public int updateUser(User user) {
		return uMapper.updateUser(user);
	}
}
