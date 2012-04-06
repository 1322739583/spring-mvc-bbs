package com.joven.service;

import java.util.List;

import com.joven.model.User;

public interface UserService {
	//新增用户 0成功，1邮箱已存在 2用户已存在
	public int addUser(User user);
	
	//修改用户0成功，1邮箱已存在
	public int updateUser(User user);

	//装载单个用户
	public User getUser(String userID);

	//取用户列表
	public List<User> listUser(String condition);
}
