<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>错误</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<link href="<%=basePath%>/css/bbs/style/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<br/><br/>
		<center>
			<form action="bbs/topic.do?method=test" method="post">
			<table>
					<tr>
						<td><input type="text" name="users[0].name" value="老师"></td>
						<td><input type="text" name="users[1].name" value="老师同学名"></td>
						<td><input type="text" name="users[2].name" value="老师同学名xxxx"></td>
					</tr>
			</table>
			<input type="submit" value="提交">
			</form>
			<br>
			<br>
			<br>
		</center>
	</body>
</html>
