package com.joven.service;

import java.util.List;

import com.joven.model.ForumGroup;

public interface ForumGroupService {
	//新增版块组
	public int addGroup(ForumGroup fg);

	//修改版块
	public int updateGroup(ForumGroup fg);
	
	//删除版块组
	public int delGroup(int forumGroupID);
	
	//列出指定版块组
	public ForumGroup getForumGroup(int fgID, boolean getForums);
	
	//列出所有版块组
	public List<ForumGroup> getForumGroups(boolean getForums);
	
	//列出所有版块组，版块及版主,forumGroupID为-1时取全部
	public List<ForumGroup> getFGDatas(int forumGroupID);
}
