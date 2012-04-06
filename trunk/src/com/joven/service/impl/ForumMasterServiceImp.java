package com.joven.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.joven.model.ForumMaster;
import com.joven.service.ForumMasterService;

@Component("forumMasterServiceImp")
public class ForumMasterServiceImp extends BaseServiceImp implements ForumMasterService {
	
	//0添加成功，1用户不存在，2版主已存在
	@Transactional(propagation=Propagation.REQUIRED)
	public int addForumMaster(ForumMaster forumMaster){
		//判断用户是否存在
		if (!dao.isExists("from User where account=?", forumMaster.getUserID())){
			return 1;
		}

		//版主是否存在
		if (dao.isExists("from ForumMaster m where m.forumID=? and m.userID=?", 
				forumMaster.getForumID(),forumMaster.getUserID())){
			return 2;
		}
		
		//生成ID，并保存
		String id=forumMaster.getForumID()+"u"+forumMaster.getUserID();
		forumMaster.setId(id);
		dao.save(forumMaster);
		return 0;
	}

	//删除版主
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean delForumManager(ForumMaster forumMaster){
		dao.delete(forumMaster);
		return true;
	}
	
	//某人是否某版版主
	@Transactional(propagation=Propagation.REQUIRED)
	public boolean isForumMaster(int forumID,String userID){
		return dao.isExists("from ForumMaster m where m.forumID=? and m.userID=?", 
				forumID,userID);
	}
	
	//取某版版主
	@Transactional(propagation=Propagation.REQUIRED)
	public List<ForumMaster> getForumMasters(int forumID){
		return dao.find("from ForumMaster m where m.forumID=?", forumID);
	}
}
