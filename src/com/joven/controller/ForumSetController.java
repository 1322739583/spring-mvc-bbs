package com.joven.controller;
 
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joven.model.Forum;
import com.joven.model.ForumMaster;
import com.joven.model.ForumPermission;
import com.joven.model.ForumPermissionPK;
import com.joven.service.ForumMasterService;
import com.joven.service.ForumPermissionService;
import com.joven.service.ForumService;

@Controller
@RequestMapping("/bbs/forumset.do")
public class ForumSetController{
	
	//Spring 注入
	private ForumService forumService;
	private ForumMasterService fmSvc;
	private ForumPermissionService fpSvc;

	
	//列出页面所有东西
	@RequestMapping(params="method=list")
	public String list(ModelMap model,HttpServletRequest request, HttpServletResponse response){
		int forumID=Integer.parseInt(request.getParameter("forumID"));
		Forum forum=forumService.getForum(forumID,true); 
		model.put("forum", forum);
		return "bbs/manager/forumSet";
	} 
	
	//删除版主
	@RequestMapping(params="method=deletemaster")
	public String delmaster(ForumMaster forumMaster,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		fmSvc.delForumManager(forumMaster);
		return "redirect:/bbs/forumset.do?method=list&forumID="+request.getParameter("forumID");
	}
	
	
	//添加版主
	@RequestMapping(params="method=addmaster")
	public String addmaster(ForumMaster forumMaster,ModelMap model,HttpServletRequest request, HttpServletResponse response){
		int x=fmSvc.addForumMaster(forumMaster);
		List<String> errors=new ArrayList<String>();
		switch(x){
		case 0:{
			return "redirect:/bbs/forumset.do?method=list&forumID="+request.getParameter("forumID");
		}
		case 1: {
			errors.add("指定用户不存在");
			model.put("errors",errors);
			break;
		}
		case 2:
			errors.add("该用户已经是该版版主");
			model.put("errors",errors);
			break;
		}
		return "bbs/manager/errors";
	}
		
	
	//更新权限
	@RequestMapping(params="method=updatepermission")
	public void updatePmsn(ForumPermission permission,ModelMap model,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ForumPermissionPK fpPK=new ForumPermissionPK();
		fpPK.setRoleID(Integer.parseInt(request.getParameter("roleID")));
		fpPK.setForumID(Integer.parseInt(request.getParameter("forumID")));
		permission.setFpPK(fpPK);
		fpSvc.updateForumPermission(permission);
		response.getWriter().write("saved");
	}
	
	@Resource(name="forumServiceImp")
	public void setForumSvc(ForumService forumSvc) {
		this.forumService = forumSvc;
	}

	@Resource(name="forumMasterServiceImp")
	public void setFmSvc(ForumMasterService fmSvc) {
		this.fmSvc = fmSvc;
	}

	@Resource(name="forumPermissionServiceImp")
	public void setFpSvc(ForumPermissionService fpSvc) {
		this.fpSvc = fpSvc;
	}
}
