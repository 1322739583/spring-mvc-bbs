package com.joven.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joven.model.User;
import com.joven.model.Forum;
import com.joven.model.Reply;
import com.joven.model.Topic;
import com.joven.service.ForumService;
import com.joven.service.ReplyService;
import com.joven.service.TopicService;
import com.joven.utils.StrUtils;

@Controller
@RequestMapping("/reply.do")
public class ReplyController{

	@Resource(name="replyServiceImp")
	private ReplyService rpSvc;
	@Resource(name="topicServiceImp")
	private TopicService tpSvc;
	@Resource(name="forumServiceImp")
	private ForumService fSvc; 
	 
	//进入新增回复界面
	@RequestMapping(params="method=add",method=RequestMethod.GET)
	public String toAdd(Reply reply,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		//取帖子
		Topic topic=tpSvc.getTopic(reply.getTopicID());
		
		//取板块
		Forum forum=fSvc.getForum(topic.getForumID(),false);
		
		model.put("topic",topic);
		model.put("forum", forum);
		 
		//定向到显示页
		return "replynew";
	}
	
	
	//新增回复
	@RequestMapping(params="method=add",method=RequestMethod.POST)
	public String add(Reply reply,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		User user=(User) request.getSession().getAttribute("user");
		reply.setAuthor(user);
		reply.setTitle(StrUtils.HtmlEncode(reply.getTitle()));
		rpSvc.addReply(reply);
		return "redirect:topic.do?method=view&forumID="+request.getParameter("forumID")+"&topicID="+reply.getTopicID();
	}
	
	
	//进入修改回复界面
	@RequestMapping(params="method=update",method=RequestMethod.GET)
	public String toUpdate(Reply reply,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		//取帖子
		Topic topic=tpSvc.getTopic(reply.getTopicID());
		model.put("topic", topic);
		
		//取板块
		Forum forum=fSvc.getForum(topic.getForumID(),false);
		model.put("forum", forum);
		
		//取回复
		Reply dbreply=rpSvc.getReply(reply.getID());
		model.put("reply", dbreply);
		
		//定向到显示页
		return "replyupdate";
	}
	
	//修改回复
	@RequestMapping(params="method=update",method=RequestMethod.POST)
	public String update(Reply reply,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		Reply dbReply=rpSvc.getReply(reply.getID());
		dbReply.setTitle(StrUtils.HtmlEncode(reply.getTitle()));
		dbReply.setContent(reply.getContent());
		rpSvc.updateReply(dbReply);
		return "redirect:topic.do?method=view&forumID="+request.getParameter("forumID")+"&topicID="+reply.getTopicID();
	}
	
	//删除回复
	@RequestMapping(params="method=delete")
	public String del(Reply reply,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		rpSvc.delReply(reply);
		return "redirect:topic.do?method=view&forumID="+request.getParameter("forumID")+"&topicID="+reply.getTopicID();
		}
	

}
