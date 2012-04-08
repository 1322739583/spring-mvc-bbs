package com.joven.service;

import java.util.List;

import com.joven.model.ForumGroup;

public interface ForumGroupService extends BaseService<ForumGroup,Integer> {
	//列出指定版块组
	public ForumGroup getForumGroup(int forumGroupId, boolean getForums);
	
	//列出所有版块组
	public List<ForumGroup> getForumGroups(boolean getForums);
	
	//列出所有版块组，版块及版主,forumGroupID为-1时取全部
	public List<ForumGroup> getFGDatas(int forumGroupId);
}
