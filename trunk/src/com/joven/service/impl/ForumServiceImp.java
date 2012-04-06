package com.joven.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.joven.model.Forum;
import com.joven.model.ForumGroup;
import com.joven.service.ForumGroupService;
import com.joven.service.ForumService;

@Component("forumServiceImp")
public class ForumServiceImp extends BaseServiceImp implements ForumService {
	private ForumGroupService forumGroupService;
	
	// 添加版块
	@Transactional(propagation=Propagation.REQUIRED)
	public void addForum(Forum forum,int forumGroupID){
		ForumGroup fg=forumGroupService.getForumGroup(forumGroupID, false); 
		//最大序号
		int order=dao.getNum("Select max(sortOrder) from Forum where FgID=?", forumGroupID);
		order++;
		
		//更新并保存
		forum.setForumGroup(fg);
		forum.setSortOrder(order);
		dao.save(forum);
	}
	 
	// 修改版块
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateForum(Forum forum){
		 dao.update(forum);
	}
	
	// 修改版块标题和备注内容
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateForumTitle(Forum forum){
		Forum dbForum=dao.getById(Forum.class,forum.getId());
		dbForum.setName(forum.getName());
		dbForum.setDescription(forum.getDescription());
		dao.update(dbForum);
	}

	// 删除版块
	@Transactional(propagation=Propagation.REQUIRED)
	public void delForums(Forum forum){
		//先删除版块相关东西
		
		//删除回复
		String sql="delete Reply where topicID in (select topicID from Topic where forumID=?)";
		dao.executeUpdate(sql, forum.getId());

		//删除帖子
		sql="delete Topic where forumID=?";
		dao.executeUpdate(sql, forum.getId());
		
		//删除版主
		sql="delete ForumMaster where forumID=?";
		dao.executeUpdate(sql, forum.getId());
		
		//删除权限
		sql="delete ForumPermission where forumID=?";
		dao.executeUpdate(sql, forum.getId());
		
		//删除版块
		sql="delete Forum where id=?";
		dao.executeUpdate(sql, forum.getId());
	}

	// 取某一版块,getData是否取全部关联数据
	@Transactional(propagation=Propagation.REQUIRED)
	public Forum getForum(int forumID,boolean getData){
		Forum forum=dao.getById(Forum.class,forumID);
		if (getData){
			dao.initialize(forum.getMasters());
			dao.initialize(forum.getPermission());
		}
		return forum;
	}

	@Resource(name="forumGroupServiceImp")
	public void setFgSvc(ForumGroupService fgSvc) {
		this.forumGroupService = fgSvc;
	}
	
}
