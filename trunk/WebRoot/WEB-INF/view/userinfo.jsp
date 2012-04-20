<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="images/favicon.ico" />
    <title>用户设置</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  

  <body>
   <jsp:include page="banner.jsp"></jsp:include>
   <jsp:include page="showlogin.jsp"></jsp:include>

    <div id="main">
    
    <div Style="MARGIN: 6px 6px;"><span style="float:right"><a href="javascript:history.back()">[ 返回  ]</a></span>
	※<B><a href="grouplistAllData.action">【论坛首页】</a></B>&nbsp;-&nbsp;用户设置
    </div>

	<s:set name="user" value="#session.user"/>

	<!--      用户资料表单        -->	
	<table cellspacing="0" cellpadding="0" width="100%" >
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>用户资料</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset style="margin:1% 30% 0% 30%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">基本信息</legend>
				<table class="tbf">
				<tr>
				<td rowspan="4" width="120"><img src="images/face/${user.face}"></td>
				<td width="80">用户ID:</td>	<td>${user.id}</td>
				</tr>
				<tr>
				<td>性别:</td>	<td><s:if test="#user.sex">男</s:if><s:else>女</s:else></td>
				</tr>
				<tr>
				<td>email:</td>	<td>${user.email}</td>
				</tr>
				<tr>
				<td>注册日期:</td><td><s:date name="#user.regDate" format="yyyy-MM-dd"/></td>
				</tr>
				</table>
				</fieldset>
				<br>
				<a href="userupdate.jsp"><img src="images/btnupdate.gif" alt="修改资料" border="0"/></a>
				<a href="userchangepw.jsp"><img src="images/btnpw.gif" alt="修改密码" border="0" /></a>
				</center>
				<br>
				<br>
		       </td>
		    </tr>
	</table>
	
	
	<%@include file="copyright.jsp"%>
   </div> 
  </body>
</html>
