package com.joven.service;

import com.joven.model.Forum;

public interface ForumService {
	// 添加版块
	public void addForum(Forum forum,int forumGroupID);
	
	// 修改版块
	public void updateForum(Forum forum);
	
	// 修改版块标题和备注内容
	public void updateForumTitle(Forum forum);

	// 删除版块
	public void delForums(Forum forum);

	// 取某一版块,getData是否取全部关联数据
	public Forum getForum(int forumID,boolean getData);
}
