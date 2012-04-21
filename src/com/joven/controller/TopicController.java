package com.joven.controller;
 
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.joven.model.User;
import com.joven.utils.StrUtils;
import com.joven.model.Forum;
import com.joven.model.Page;
import com.joven.model.Reply;
import com.joven.model.Topic;
import com.joven.service.ForumService;
import com.joven.service.ReplyService;
import com.joven.service.TopicService;

@Controller
@RequestMapping("/topic.do")
public class TopicController{
	private int pageSize=20;  //主题列表每页显示记录数
	private int rPageSize=10; //回复每页显示记录数

	@Resource(name="forumServiceImp")
	private ForumService forumService;
	
	@Resource(name="topicServiceImp")
	private TopicService topicService;
	
	@Resource(name="replyServiceImp")
	private ReplyService replyService;
	
	//取帖子列表
	@RequestMapping(params="method=list")
	public String list(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		Forum forum=forumService.getForum(Integer.parseInt(request.getParameter("forumID")),true);
		model.put("forum", forum);
		//取列表数据
		int page=1;
		if (request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		Page<Topic> tpcList=topicService.getTopicList(forum.getId(),forum.getTotalTopics(),pageSize, page);
		tpcList.setShowPage(1); //前后显示1个页码,一共显示3个页码
		model.put("page", page);
		model.put("tpcList",tpcList);
		return "topiclist";
	}

	//查看帖子
	@RequestMapping(params="method=view")
	public String view(ModelMap model,HttpServletRequest request, HttpServletResponse response) throws Exception{
		int page=1;
		if (request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		//取帖子
		Topic topic=topicService.getTopic(Integer.parseInt(request.getParameter("topicID")));
		if (topic==null){
			model.put("error", "找不到所请求的帖子，该帖子可能已经被删除。");
			return "errors";
		}
		
		//取板块
		Forum forum=forumService.getForum(topic.getForumID(),true);
	 
		//取回复列表
		Page<Reply> rpList=replyService.getReplyList(topic.getTopicID(),topic.getTotalReply(),page, rPageSize);
		rpList.setShowPage(1);//前后显示1个页码,一共显示3个页码
		
		model.put("topic", topic);
		model.put("forum", forum);
		model.put("rpList", rpList);
		model.put("page", page);
		//定向到显示页
		return "topicview";
	} 
	
	//到新增帖子页
	@RequestMapping(params="method=add",method = RequestMethod.GET)
	public String showAddTopic(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		Forum forum=forumService.getForum(Integer.parseInt(request.getParameter("forumID")),false);
		model.put("forum", forum);
		return "topicnew";
	}
	
	//新增帖子
	@RequestMapping(params="method=add",method = RequestMethod.POST)
	public String add(Topic topic,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		//取用户
		User user=(User) request.getSession().getAttribute("user");
		topic.setAuthor(user);
		
		//替换标题特殊字符
		topic.setTitle(StrUtils.HtmlEncode(topic.getTitle()));
		
		//保存
		topicService.addTopic(topic);
		return "redirect:topic.do?method=view&forumID="+topic.getForumID()+"&topicID="+topic.getTopicID();
	}
	
	//到更新帖子页
	@RequestMapping(params="method=update",method = RequestMethod.GET)
	public String showEditTopic(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		Forum forum=forumService.getForum(Integer.parseInt(request.getParameter("forumID")),false);
		model.put("forum", forum);
		Topic topic=topicService.getTopic(Integer.parseInt(request.getParameter("topicID")));
		if (topic==null){
			model.put("error", "找不到所请求的帖子，该帖子可能已经被删除。");
			return "errors"; 
		}
		model.put("topic", topic);
		return "topicupdate";
	}
	
	//更新帖子
	@RequestMapping(params="method=update",method = RequestMethod.POST)
	public String update(Topic topic,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		//保存
		Topic dbtopic= topicService.getTopic(topic.getTopicID());
		if (dbtopic==null){
			model.put("error", "找不到所请求的帖子，该帖子可能已经被删除。");
			return "errors";
		}
		dbtopic.setTitle(StrUtils.HtmlEncode(topic.getTitle()));
		dbtopic.setContent(topic.getContent());
		dbtopic.setLastUpdate(new Date());
		topicService.updateTopic(dbtopic);
		return "redirect:topic.do?method=view&forumID="+dbtopic.getForumID()+"&topicID="+dbtopic.getTopicID();
	}
	
	//删除帖子
	@RequestMapping(params="method=delete")
	public String del(Topic topic,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		topicService.deleteTopic(topic);
		//重定向到发的板块
		return "redirect:topic.do?method=list&page=1&forumID="+topic.getForumID();
	}

}
