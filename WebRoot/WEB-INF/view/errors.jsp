<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>错误</title>
		<%@ include file="/common.jsp"%>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<body>
		<br/><br/>
		<center>
			<table>
			<tr><td><img src="images/error.gif"/></td>
			<td>
				<div class="errorMessage">${error}</div>
				<c:forEach items="${errors}" var="err">
					<div class="errorMessage">${err}</div>
				</c:forEach>
			</td>
			<tr>
			
			<td align="center" colspan="2"><div><a href="javascript:history.back()"><br/>返 回</a></div></td>
			
			</tr>	
			</table>
			
			<br>
			<br>
			<br>
		</center>
	</body>
</html>
