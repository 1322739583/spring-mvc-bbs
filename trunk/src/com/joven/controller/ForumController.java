package com.joven.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joven.model.Forum;
import com.joven.service.ForumService;

@Controller
@RequestMapping("/bbs/forum.do")
public class ForumController{

	@Resource(name="forumServiceImp")
	private ForumService forumService;
	
	@RequestMapping(params="method=save")
	public String add(Forum forum,ModelMap model,
			HttpServletRequest request, HttpServletResponse response){
		int forumGroupID=Integer.parseInt(request.getParameter("forumGroupID"));
		forumService.addForum(forum,forumGroupID);
		return "redirect:forumgroup.do?method=listAll";
	}
	
	@RequestMapping(params="method=update")
	public String update(Forum forum,ModelMap model,
			HttpServletRequest request, HttpServletResponse response){
		forumService.updateForumTitle(forum);
		
		//从设置页面进入时，返回设置页面
		if (request.getParameter("formset")!=null){
			return "redirect:forumset.do?method=list&forumID="+forum.getId();
		}
		
		return "redirect:forumgroup.do?method=listAll";
	}
	
	@RequestMapping(params="method=delete")
	public String del(Forum forum,ModelMap model,
			HttpServletRequest request, HttpServletResponse response){
		forumService.delForums(forum);
		return "redirect:forumgroup.do?method=listAll";
	}

}
