package com.joven.service.impl;

import java.util.Date;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.joven.model.Forum;
import com.joven.model.Page;
import com.joven.model.Topic;
import com.joven.service.TopicService;

@Component("topicServiceImp")
public class TopicServiceImp extends BaseServiceImp<Topic,Integer> implements TopicService {
	//新增帖子
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean addTopic(Topic topic){
		//新增时的其它信息
		Date mydate=new Date();
		topic.setPostTime(mydate);
		topic.setLastReplyDate(mydate);
		topic.setLastReplyUserID(topic.getAuthor().getId());
		
		//保存帖子
		dao.save(topic);
		
		//更新版块帖子数，最新回复人等
		Forum forum=dao.getById(Forum.class,topic.getForumID());
		forum.setTopicDate(mydate);
		forum.setTopicID(topic.getTopicID());
		forum.setTopicTitle(topic.getTitle());
		forum.setUserID(topic.getAuthor().getId());
		forum.setTotalTopics(forum.getTotalTopics()+1);
		dao.update(forum);
		
		/*	
		//更新用户发帖数
		User user=dao.getById(User.class,topic.getAuthor().getId());
		user.setTotalTopics(user.getTotalTopics()+1);
		dao.save(user);
		*/
		
		return true;
	}

	//删除帖子
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean deleteTopic(Topic topic){
		//先删除回复
		dao.executeUpdate("delete Reply where TopicID=?", topic.getTopicID());
		
		//删除帖子
		Topic dbTopic=dao.getById(Topic.class, topic.getTopicID());
		if (dbTopic==null){return true;};
		dao.delete(dbTopic);
		
		//更新版块帖子数
		Forum forum=dao.getById(Forum.class,dbTopic.getForumID());
		forum.setTotalTopics(forum.getTotalTopics()-1);
		dao.update(forum);
       
		/*		
		//更新用户帖子数 
		User user=dao.getById(User.class,dbTopic.getAuthor().getId());
		user.setTotalTopics(user.getTotalTopics()-1);
		dao.save(user);
		
		*/
		
		return true;			
	}
	
	//更新帖子内容
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean updateTopic(Topic topic){
		dao.update(topic);
		return true; 
	}

	//根据ID取主题
	@Transactional(propagation=Propagation.REQUIRED)
	public Topic getTopic(int topicID){
		return dao.getById(Topic.class,topicID);
	}
	
	 /**
	  * @param forumID 论坛ID
	  * @param pageSize 一页多少行记录
	  * @param page 请求第几页
	  * @return 请求页帖子列表
	  */
	@Transactional(propagation=Propagation.REQUIRED)
    public Page<Topic> getTopicList(int forumID,int totalTopic,int pageSize,int page){
    	return dao.getPages(totalTopic,page, pageSize, "from Topic where forumID=? order by lastReplyDate desc", forumID); 
    }
     
  //判断指定帖子存不存在
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean topicExists(int topicID,String userID){
		return dao.isExists("from Topic where topicID=? and userID=?", topicID,userID);
	}
}
