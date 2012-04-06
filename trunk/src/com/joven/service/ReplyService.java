package com.joven.service;

import com.joven.model.Page;
import com.joven.model.Reply;

public interface ReplyService {
	//添加回复
	public boolean addReply(Reply reply);
	
	//删除单个回复
	public boolean delReply(Reply reply);

	//修改回复
	public boolean updateReply(Reply reply);

	//加载回复
	public Reply getReply(int replyID);

	//加载帖子回复列表
	public Page<Reply> getReplyList(int topicID,int totalCount,int page,int pageSize);
	
	//判断指定回复存不存在
	public boolean replyExists(int replyID,String userID);
	
}
