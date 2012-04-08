package com.joven.service.impl;

import org.springframework.stereotype.Component;

import com.joven.model.Forum;
import com.joven.service.ForumService;

@Component("forumServiceImp")
public class ForumServiceImp extends BaseServiceImp<Forum,Integer> implements ForumService {
	
	// 添加版块
	@Override
	public int save(Forum forum){
		//最大序号
		int order=dao.getNum("Select max(sortOrder) from Forum f where f.forumGroup.id=?", forum.getForumGroup().getId());
		order++;
		
		//保存
		forum.setSortOrder(order);
		dao.save(forum);
		return 0;
	}
	 
	// 修改版块
	@Override
	public int update(Forum forum){
		 dao.update(forum);
		 return 0;
	}

	// 删除版块
	@Override
	public int delete(Forum forum){
		//先删除版块相关东西
		
		//删除回复
		String sql="delete Reply where topicID in (select topicID from Topic where forumID=?)";
		dao.executeUpdate(sql, forum.getId());

		//删除帖子
		sql="delete Topic t where forumID=?";
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
		return 0;
	}

	// 取某一版块,getData是否取全部关联数据
	public Forum getForum(int forumID,boolean getData){
		Forum forum=dao.getById(Forum.class,forumID);
		if (getData){
			dao.initialize(forum.getMasters());
			dao.initialize(forum.getPermission());
		}
		return forum;
	}
	
}
