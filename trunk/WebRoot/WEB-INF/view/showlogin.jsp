<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 

<div class="showlogin">
	<c:choose>
		<c:when test="${sessionScope.user eq null}">
			您尚未登录 <a href="user.do?method=login">登录</a>&nbsp;| &nbsp;<A href="user.do?method=register">注册</A>
		</c:when>
		<c:otherwise>
			欢迎:&nbsp;${sessionScope.user.id}&nbsp;&nbsp;<a href="user.do?method=info">[设置]</a>&nbsp;&nbsp;<a href="user.do?method=logout">[退出]</a>
		</c:otherwise>
	</c:choose>
</div>