<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<HTML>
<HEAD>
	<TITLE>论坛--登录</TITLE>
	<%@ include file="/common.jsp"%>
</HEAD>

<script language="javascript">
function checkpost() {
 if(document.loginForm.id.value==""){
    alert("用户名不能为空");
    return;
 }
 if(document.loginForm.passWord.value==""){
    alert("密码不能为空");
    return;
 }
 
 document.loginForm.submit();
}
</script>

<BODY>
    <jsp:include page="banner.jsp"></jsp:include>
    <jsp:include page="showlogin.jsp"></jsp:include>
    
	<div class="position">
	    <a href="forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;&nbsp;-&nbsp;&nbsp;论坛登录
	</div>

	<!--      用户登录表单        -->	
	<FORM name="loginForm" action="user.do?method=login" method="post"  >
	<table cellspacing="1" class="tb">
		    <tr>
		      <th>&nbsp;</th>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset><legend>登录信息</legend>
				<table>
				<tr><td>用户名：</td><td><INPUT tabIndex="1" type="text" maxLength="30" size="35" name="id"></td></tr>
				<tr><td>密 码：</td><td><INPUT tabIndex="2" type="password" maxLength="30" size="35" name="passWord"></td></tr>
				</table>
				</fieldset>
				<img src="images/login.gif"  style="cursor:pointer;margin-top:5px" border="0" onclick="javacript:checkpost()" alt="提交"></img>
				</center>
				<br>
				<br>
				<br>
		       </td>
		    </tr>
	</table>
	</form>
	
	<%@include file="copyright.jsp"%>
</BODY>
</HTML>
