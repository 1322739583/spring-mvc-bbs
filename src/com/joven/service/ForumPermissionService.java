package com.joven.service;

import com.joven.model.ForumPermission;
import com.joven.model.ForumPermissionPK;

public interface ForumPermissionService {
	//不存在则新增，存在则更新
	public void updateForumPermission(ForumPermission fPermission);

	// 加载权限
	public ForumPermission loadpermisson(ForumPermissionPK fpPK);
	
	//删除整版权限
	public void delPermissons(int forumID);
}
