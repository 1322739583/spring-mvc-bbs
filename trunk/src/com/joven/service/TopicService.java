package com.joven.service;

import com.joven.model.Page;
import com.joven.model.Topic;

public interface TopicService {
	//新增帖子
	public boolean addTopic(Topic topic);

	//删除帖子
	public boolean deleteTopic(Topic topic);
	
	//更新帖子
	public boolean updateTopic(Topic topic);

	//根据ID取主题
	public Topic getTopic(int topicID);
	
	 /**
	  * @param forumID 论坛ID
	  * @param totalTopic 总帖子数
	  * @param pageSize 一页多少行记录
	  * @param page 请求第几页
	  * @return 请求页帖子列表
	  */
    public Page<Topic> getTopicList(int forumID,int totalTopic,int pageSize,int page);
    
  //判断指定帖子存不存在
	public boolean topicExists(int topicID,String userID);
}
