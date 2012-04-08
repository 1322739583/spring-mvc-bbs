package com.joven.service.impl;

import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Component;

import com.joven.model.Forum;
import com.joven.model.ForumGroup;
import com.joven.service.ForumGroupService;

@Component("forumGroupServiceImp")
public class ForumGroupServiceImp extends BaseServiceImp<ForumGroup,Integer> implements	ForumGroupService {

	/**
	 * 新增版块组
	 * 
	 * @return 0新增成功,1有相同版组组名
	 */
	@Override
	public int save(ForumGroup forumGroup) {
		// 名称是否存在
		if (dao.isExists("from ForumGroup where name=?", forumGroup.getName())) {
			return 1;
		}

		// 取最大序号
		int order = dao.getNum("Select Max(a.order) from ForumGroup a");
		order++;

		// 保存
		forumGroup.setOrder(order);
		dao.save(forumGroup);
		return 0;
	}

	/**
	 * 修改版块组
	 * 
	 * @return 0通过,1名称已经存在
	 */
	@Override
	public int update(ForumGroup fourmGroup) {
		// 新名称是否存在
		String hsql = "from ForumGroup where name=? and id<>?";
		if (dao.isExists(hsql, fourmGroup.getName(), fourmGroup.getId())) {
			return 1;
		}

		// 取出旧数据
		ForumGroup nfg = dao.getById(fourmGroup.getClass(), fourmGroup.getId());

		// 更新并保存
		nfg.setName(fourmGroup.getName());
		dao.save(nfg);
		return 0;
	}

	/**
	 * 删除版块组
	 * 
	 * @return 0删除成功,1还有子版块
	 */
	@Override
	public int deleteById(Integer forumGroupID) {
		//删除前校验
		if (dao.isExists("from Forum where forumGroupId=?", forumGroupID)) {
			return 1;
		}

		// 删除
		return super.deleteById(forumGroupID);
	}

	
	// 取版块组数据(getForums是否取其中的板块）
	public ForumGroup getForumGroup(int fgID, boolean getForums) {
		ForumGroup forumgroup = dao.getBySQL("from ForumGroup p where p.id=?",fgID);

		if (getForums) {
			dao.initialize(forumgroup.getForums());
		}
		return forumgroup;
	}

	// 列出所有版块组与其中的版块(getForums是否取其中的板块)
	public List<ForumGroup> getForumGroups(boolean getForums) {
		List<ForumGroup> fglst=dao.find("from ForumGroup order by order");
		
		if (getForums){
			for(ForumGroup fg:fglst){
				dao.initialize(fg.getForums());
			}
		}
		return fglst;
	}
	
	//列出所有版块组，版块及版主,forumGroupID为-1时取全部
	public List<ForumGroup> getFGDatas(int forumGroupID){
		List<ForumGroup> fglst=null;
		if (forumGroupID==-1){
			fglst=dao.find("from ForumGroup order by order");
		}
		else 
		{
			fglst=dao.find("from ForumGroup where fgID=? order by order",forumGroupID);
		}
		
		for(ForumGroup fg:fglst){
			dao.initialize(fg.getForums());
			Iterator<Forum> fit=fg.getForums().iterator();
			while (fit.hasNext()){
				Forum forum=fit.next();
				dao.initialize(forum.getMasters());
			}
		}
		return fglst;		
	}

}
