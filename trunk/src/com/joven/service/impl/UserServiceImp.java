package com.joven.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import com.joven.service.UserService;
import com.joven.model.User;

@Component("userServiceImp")
public class UserServiceImp extends BaseServiceImp<User,String> implements UserService {

	//新增用户 0成功，1邮箱已存在 2用户已存在
	public int addUser(User user){
		//判断邮箱是否存在
		if (!user.getEmail().trim().equals("")){
			if (dao.isExists("from User where email=?", user.getEmail()))
				return 1;
		}
		
		//判断用户是否存在
		if (dao.getById(User.class, user.getId())!=null){
			return 2;
		}
		
		//保存用户
		save(user);
		return 0;
	}
	
	//修改用户0成功，1邮箱已存在
	public int updateUser(User user){
		//判断邮箱是否存在
		if (!user.getEmail().trim().equals("")){
			if (dao.isExists("from User where email=? and id<>?", user.getEmail(),user.getId()))
				return 1;
		}
		
		//更新用户
		update(user);
		return 0;
	}

	//装载单个用户
	public User getUser(String userID){ 
		return dao.getById(User.class, userID);
	}

	//取用户列表
	public List<User> listUser(String condition){
		String whr="where RoleID<>-1";
		if (!condition.trim().equals(""))
			{whr=whr+" and "+condition;}
		return dao.find("from User "+ whr);
	}

}
