package com.joven.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.joven.model.User;

//HandlerInterceptorAdapter类
public class BgAuthorityInterceptor extends HandlerInterceptorAdapter {
	
	// 重写 preHandle()方法，在业务处理器处理请求之前对该请求进行拦截处理
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		//取action及其名字
		String action=request.getRequestURI();
		String method=request.getParameter("method");
		
		//不拦截登录页
		if (action.contains("user.do")&&
				(method.equals("login")||(method.equals("syslogin")))){
			return true;
		}
		
		//取当前用户
		User user=(User) request.getSession().getAttribute("user"); 
		if ((user==null)||(user.getRole()!=-1)){
			goToErrorPage(request, response);
		}
		
		return true;
	}
	
	private boolean goToErrorPage(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setAttribute("errormsg", "对不起，你没此权限。");
		request.getRequestDispatcher("/WEB-INF/view/manager/errors.jsp").forward(request, response);
		return false;
	}
	
	
	
}