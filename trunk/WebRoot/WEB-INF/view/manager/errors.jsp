<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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

		<title>´íÎó</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath%>/css/bbs/style/style.css" rel="stylesheet" type="text/css" />
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
			
			<td align="center" colspan="2"><div><a href="javascript:history.back()">·µ »Ø</a></div></td>
			
			</tr>	
			</table>
			
			<br>
			<br>
			<br>
		</center>
	</body>
</html>
