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

    <div id="main">
    
    <div class="posti"><span style="float:right"><a href="javascript:history.back()">[ 返回  ]</a></span>
	※<B><a href="forumgroup.do?method=listForumGroups">【论坛首页】</a></B>&nbsp;-&nbsp;用户设置
    </div>

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
