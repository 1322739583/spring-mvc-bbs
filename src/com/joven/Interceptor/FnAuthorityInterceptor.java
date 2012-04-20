package com.joven.Interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.joven.model.ForumPermission;
import com.joven.model.ForumPermissionPK;
import com.joven.model.User;
import com.joven.service.ForumMasterService;
import com.joven.service.ForumPermissionService;

//HandlerInterceptorAdapter类
public class FnAuthorityInterceptor extends HandlerInterceptorAdapter {

	@Resource(name="forumMasterServiceImp")
	private ForumMasterService forumMasterService;
	@Resource(name="forumPermissionServiceImp")
	private ForumPermissionService forumPermissionService;
	
	// 重写 preHandle()方法，在业务处理器处理请求之前对该请求进行拦截处理
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		//进行修改与删除操作时，根据传进来topic和reply的account来判断不安全,但可免查数据库
		//取当前用户
		User user=(User) request.getSession().getAttribute("user"); 
		
		int role=0;
		if (user!=null){
			role=user.getRole();
		}
		
 		//不对超级管理员做任何限制做任何限制
		if (role==-1){
			return true;
		}
		
		//取action及其名字
		String action=request.getRequestURI();
		String method=request.getParameter("method");
		
		//取板块ID
		String forumID =request.getParameter("forumID");
		
		//不对本版版主做任何限制做任何限制
		if (forumMasterService.isForumMaster(Integer.parseInt(forumID), user.getId())){
				return true;
		}
		
		//取权限
		ForumPermissionPK fpPK=new ForumPermissionPK();
		fpPK.setForumID(Integer.parseInt(forumID));
		fpPK.setRoleID(role); //role=1为普通会员,0游客,-1为超级管理员
		ForumPermission permission=forumPermissionService.loadpermisson(fpPK);
		if (permission==null){
			return goToErrorPage(request, response);
		}
		
		//对topic.do的控制
		if (action.contains("topic.do")){
			return handleTopic(method, permission, user, request, response);
		}
		
		//对reply.do的控制
		if (action.contains("reply.do")){
			return handleReply(method, permission, user, request, response);
		}
			
		return true;
	}
	
	private boolean goToErrorPage(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setAttribute("errormsg", "对不起，你没此权限。");
		request.getRequestDispatcher("/WEB-INF/view/errors.jsp").forward(request, response);
		return false;
	}
	
	//处理帖子
	private boolean handleTopic(String method,ForumPermission permission,User user,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		if (method.equals("list")&&!permission.getViewList()){
			return goToErrorPage(request, response);
		}
		
		if (method.equals("view")&&!permission.getViewDetail()){
			return goToErrorPage(request, response);
		}
		
		if (method.equals("add")&&!permission.getAddTopic()){
			return goToErrorPage(request, response);
		}
		
		if (method.equals("update")){
			if (!permission.getModifyTopic()){
				return goToErrorPage(request, response);
			}
			
			//是否修改本人的帖子,根据传入用户来判断
			if (!request.getParameter("account").equals(user.getId())){
				return goToErrorPage(request, response);
			}
		}
		
		
		if (method.equals("delete")){
			if (!permission.getDeleteTopic()){
				return goToErrorPage(request, response);
			}
			
			//是否修改本人的帖子,根据传入用户来判断
			if (!request.getParameter("account").equals(user.getId())){
				return goToErrorPage(request, response);
			}
		}
		
		return true;
	}
	
	//处理回复
	private boolean handleReply(String method,ForumPermission permission,User user,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		if (method.equals("add")&&!permission.getReplyTopic()){
			return goToErrorPage(request, response);
		}
		
		if (method.equals("update")){
			
			if (!permission.getModifyTopic()){
				return goToErrorPage(request, response);
			}
			
			//是否修改本人的回复
			if (!request.getParameter("account").equals(user.getId())){
				return goToErrorPage(request, response);
			}
		}
		
		if (method.equals("delete")){
			if (!permission.getDeleteTopic()){
				return goToErrorPage(request, response);
			}
			
			//是否删除本人的回复 
			if (!request.getParameter("account").equals(user.getId())){
				return goToErrorPage(request, response);
			}
		}
		return true;
	}
	
	
}