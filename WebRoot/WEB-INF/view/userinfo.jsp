<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title>用户设置</title>
    <%@ include file="/common.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  

  <body>
   <jsp:include page="banner.jsp"></jsp:include>
   <jsp:include page="showlogin.jsp"></jsp:include>

    <div class="position">
    	<span class="floatright"><a href="javascript:history.back()">[返回]</a>&nbsp;</span>
	    <a href="forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;&nbsp;-&nbsp;&nbsp;用户设置
	</div>

	<!--      用户资料表单        -->	
	<table cellspacing="1" cellpadding="0" class="tb">
		    <tr>
		      <th><b>用户资料</b></th>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset><legend>基本信息</legend>
				<table class="tbf">
				<tr>
				<td rowspan="4" width="120"><img src="images/face/${user.face}"></td>
				<td width="80">用户ID:</td>	<td>${user.id}</td>
				</tr>
				<tr>
				<td>性别:</td>	<td>${user.sex?'男':'女'}</td>
				</tr>
				<tr>
				<td>email:</td>	<td>${user.email}</td>
				</tr>
				<tr>
				<td>注册日期:</td><td><fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				</table>
				</fieldset>
				<br>
				<a href="user.do?method=update"><img src="images/btnupdate.gif" alt="修改资料" border="0"/></a>
				<a href="user.do?method=updatepw"><img src="images/btnpw.gif" alt="修改密码" border="0" /></a>
				</center>
				<br>
				<br>
		       </td>
		    </tr>
	</table>
	
	
	<%@include file="copyright.jsp"%>
  </body>
</html>
