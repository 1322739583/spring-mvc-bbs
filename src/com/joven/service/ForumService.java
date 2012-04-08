package com.joven.service;

import com.joven.model.Forum;

public interface ForumService extends BaseService<Forum,Integer> {
	// 取某一版块,getData是否取全部关联数据
	public Forum getForum(int forumID,boolean getData);
}
