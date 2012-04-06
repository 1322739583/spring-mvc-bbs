package com.joven.service;

import java.util.List;

import com.joven.model.ForumMaster;

public interface ForumMasterService {
	//0添加成功，1用户不存在，2版主已存在
	public int addForumMaster(ForumMaster forumMaster);
	
	//删除版主
	public boolean delForumManager(ForumMaster forumMaster);
	
	//某人是否某版版主
	public boolean isForumMaster(int forumID,String userID);
	
	//取某版版主
	public List<ForumMaster> getForumMasters(int forumID);
}
