package com.joven.service.impl;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.joven.model.ForumPermission;
import com.joven.model.ForumPermissionPK;
import com.joven.service.ForumPermissionService;

@Component("forumPermissionServiceImp")
public class ForumPermissionServiceImp extends BaseServiceImp<ForumPermission,String> implements ForumPermissionService {
	//不存在则新增，存在则更新
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateForumPermission(ForumPermission fPermission){
		dao.saveOrUpdate(fPermission);
	}

	// 加载权限
	@Transactional(propagation=Propagation.REQUIRED)
	public ForumPermission loadpermisson(ForumPermissionPK fpPK){
		return dao.getById(ForumPermission.class, fpPK);
	}
	
	//删除整版权限
	@Transactional(propagation=Propagation.REQUIRED)
	public void delPermissons(int forumID){
		dao.executeUpdate("delete ForumPermission a where a.forumID=?", forumID);
	}
}
