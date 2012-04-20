<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">

		<title>错误</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="<%=basePath%>style/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<center>
			<br/><br/>
			<table>
			<tr><td><img src="<%=basePath%>/css/bbs/images/error.gif"/></td>
			<td>
				<div class="errorMessage">${error}</div>
				<c:forEach items="${errors}" var="err">
					<div class="errorMessage">${err}</div>
				</c:forEach>
			</td>
			<tr>
			
			<td align="center" colspan="2"><div><a href="javascript:history.back()">返 回</a></div></td>
			
			</tr>	
			</table>
			
			<br>
			<br>
			<br>
		</center>
	</body>
</html>
