package com.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.entity.User;

public interface UserMapper {
	
	//登录
	@Select("select * from user where name=#{name} and password=#{password}")
	User login(@Param("name")String name,@Param("password")String password);
	
	//根据用户id查询该用户
	@Select("select * from user where id=#{id}")
	User selectById(Integer id);

	int updateUser(User user);
}
