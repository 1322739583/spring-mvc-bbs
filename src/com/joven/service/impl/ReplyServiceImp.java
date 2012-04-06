package com.joven.service.impl;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.joven.model.Page;
import com.joven.model.Reply;
import com.joven.model.Topic;
import com.joven.service.ReplyService;

@Component("replyServiceImp")
public class ReplyServiceImp extends BaseServiceImp implements ReplyService{
	//添加回复
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean addReply(Reply reply){
		//算楼层
		int building=dao.getNum("Select Max(building) from Reply where topicID=?", reply.getTopicID());
		
		//新增时的其它信息，保存回复
		Date mydate=new Date();
		reply.setReplyDate(mydate);
		reply.setBuilding(building+1);
		dao.save(reply);
		
		//更新帖子回复数，最新回复人等
		Topic tpc=dao.getById(Topic.class,reply.getTopicID());
		tpc.setLastReplyDate(mydate);
		tpc.setLastReplyUserID(reply.getAuthor().getId());
		tpc.setTotalReply(tpc.getTotalReply()+1);
		dao.update(tpc);
		
		/*	
		//更新用户回复数
		User user=dao.getById(User.class,reply.getAuthor().getId());
		user.setTotalReplys(user.getTotalReplys()+1);
		dao.update(user);
		*/
		
		return true;
	}
	
	//删除单个回复
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean delReply(Reply reply){
		Reply dbReply=dao.getById(Reply.class,  reply.getID());
		dao.delete(dbReply);

		//更新帖子回复数
		Topic tpc=dao.getById(Topic.class,dbReply.getTopicID());
		tpc.setTotalReply(tpc.getTotalReply()-1);
		dao.update(tpc);
		
		/*
		//更新用户回复数
		User user=dao.getById(User.class,dbReply.getAuthor().getId());
		user.setTotalReplys(user.getTotalReplys()-1);
		dao.update(user);
		*/
		
		return true;
	}

	//修改回复
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean updateReply(Reply reply){
		Reply dbreply= dao.getById(Reply.class,reply.getID());
		dbreply.setTitle(reply.getTitle());
		dbreply.setContent(reply.getContent());
		dbreply.setLastUpdate(new Date());
		dao.update(dbreply);
		return true;
	}

	//加载回复
	@Transactional(propagation=Propagation.REQUIRED)
	public Reply getReply(int replyID){
		return dao.getById(Reply.class, replyID);
	}

	//加载帖子回复列表
	@Transactional(propagation=Propagation.REQUIRED)
	public Page<Reply> getReplyList(int topicID,int totalCount,int page,int pageSize){
		return dao.getPages(totalCount, page, pageSize, "from Reply where TopicID=? order by building", topicID);
	}
	
	//判断指定回复存不存在
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean replyExists(int replyID,String userID){
		return dao.isExists("from Reply where replyID=? and userID=?",replyID, userID);
	}
	
}
