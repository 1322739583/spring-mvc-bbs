package com.joven.controller;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.org.apache.commons.beanutils.BeanUtils;
import com.joven.model.User;
import com.joven.service.UserService;

@Controller
@RequestMapping("/user.do")
public class UserController  {
	
	@Resource(name="userServiceImp")
	private UserService userService;
	
	
    //到论坛登录页
	@RequestMapping(params="method=login",method=RequestMethod.GET)
	public String toLogin(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		return "login";
	}
	 
	//普通会员登录 
	@RequestMapping(params="method=login",method=RequestMethod.POST)
	public String login(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		User loginUser=userService.getUser(user.getId()); 
		if (loginUser==null){
			model.put("error", "用户ID不存在");
			return "errors";
		}
		else{
			if (!loginUser.getPassWord().equals(user.getPassWord())){
				model.put("error", "密码错误");
				return "errors";
			}
			
			if (loginUser.getForbidden()){
				model.put("error", "该用户已被锁定，不能登录。");
				return "errors";
			}
			request.getSession().setAttribute("user", loginUser);
			request.getSession().setAttribute("userid", loginUser.getId());
			request.getSession().setAttribute("role",loginUser.getRole());
			return "redirect:forumgroup.do?method=listForumGroups";
		}
	}
	
	//管理员登录
	@RequestMapping(params="method=syslogin")
	public String syslogin(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		User loginUser=userService.getUser(user.getId());
		if (loginUser==null){
			model.put("error", "用户ID不存在");
			return "errors";
		}
		else{
			if (!loginUser.getPassWord().equals(user.getPassWord())){
				model.put("error","密码错误");
				return "errors";
			}
			  
			if (loginUser.getRole()!=-1){
				model.put("error","此用户非系统管理员");
				return "errors";
			}
			request.getSession().setAttribute("user", loginUser);
			request.getSession().setAttribute("userid", loginUser.getId());
			request.getSession().setAttribute("role",loginUser.getRole());
			return "index";
		}		
	}
	
	//登出
	@RequestMapping(params="method=logout")
	public String logout(ModelMap model,HttpServletRequest request, HttpServletResponse response){
			HttpSession session=request.getSession();
			session.invalidate();
			return "redirect:forumgroup.do?method=listForumGroups";
	}
	
	@RequestMapping(params="method=register",method=RequestMethod.GET)
	public String toRegister(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		return "register";
	}
	
	
	//用户注册
	@RequestMapping(params="method=register",method=RequestMethod.POST)
	public String Add(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		if (user.getId().trim().equals("")) {
			model.put("error","用户ID不能为空");
			return "errors";
		}

		if (user.getPassWord().trim().equals("")) {
			model.put("error","密码不能为空");
			return "errors";
		}
		
		user.setRegDate(new Date());
		user.setRole(1);
		int rt = userService.addUser(user);
		switch (rt) {
		case 0:return login(user, model, request, response);
		case 1:
			model.put("error","该邮箱已被注册过");
			return "errors";
		case 2:
			model.put("error","该用户已经存在");
			return "errors";
		default:
			model.put("error","注册失败");
			return "errors";
		}
	}
	
	//用户列表
	@RequestMapping(params="method=list")
	public String list(String cdn,int like,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		String where="";
		if (!cdn.trim().equals("")){
			if (like==1){
				where=" id like '%"+ cdn+"%' or email like '%"+ cdn+"%'" ;
			}
			else{
				where=" id='"+ cdn+"' or email='"+ cdn+"'" ;
			}
		}
		List<User> userList=userService.listUser(where);
		model.put("userList", userList);
		//to-do
		return "list";
	}
	
	//锁定/解锁用户
	@RequestMapping(params="method=lock")
	public String lock(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		User dbuser=userService.getUser(user.getId());
		dbuser.setForbidden(user.getForbidden());
		userService.updateUser(dbuser);
		return "list";
	}
	
	//到更新用户资料页
	@RequestMapping(params="method=update",method=RequestMethod.GET)
	public String toUpdate(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		return "userupdate";
	}
	
	
	//更新用户资料,注意更新session里的user
	@RequestMapping(params="method=update",method=RequestMethod.POST)
	public String update(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		User dbuser=userService.getUser(user.getId());
		dbuser.setEmail(user.getEmail());
		dbuser.setFace(user.getFace());
		dbuser.setSex(user.getSex());

		int x=userService.updateUser(dbuser);
		switch(x){
			case 0:
				//更新成功，把新数据放session里
				HttpSession session=request.getSession();
				session.setAttribute("user",dbuser);
				break;
			case 1:
				model.put("error","邮箱已经被别人使用.");
				return "errors";
			default:
				model.put("error","更新出错.");
				return "errors";
		}
		
		return "redirect:user.do?method=info";
	}
	
	//到更新用户密码页
	@RequestMapping(params="method=updatepw",method=RequestMethod.GET)
	public String toUpdatePW(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		return "userupdatepw";
	}
	
	//更新用户密码,注意更新session里的user
	@RequestMapping(params="method=updatepw",method=RequestMethod.POST)
	public String updatePW(User user,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		if (user.getPassWord().equals("")){
			model.put("error","密码不能为空");
			return "errors";
		}
		
		String oldpassWord=request.getParameter("oldpassWord");
		
		HttpSession session=request.getSession();
		User suser=(User)session.getAttribute("user");
		if (!oldpassWord.equals(suser.getPassWord())){
			model.put("error","旧密码不正确.");
			return "errors";
		}
		
		User dbuser=userService.getUser(user.getId()); 
		dbuser.setPassWord(user.getPassWord());
		
		if (userService.updateUser(dbuser)==0){
			//更新成功，把新数据放session里
			try {
				BeanUtils.copyProperties(suser,dbuser);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		else{
			model.put("error","更新时出错");
			return "errors";
		}
		
		return "redirect:user.do?method=info";
	}
	
	
	//刷新session里的user
	@RequestMapping(params="method=info")
	public String info(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		
		User dbuser=userService.getUser(user.getId());
		if (dbuser!=null){
			session.setAttribute("user", dbuser);
		}
		return "userinfo"; 
	}
	

}
