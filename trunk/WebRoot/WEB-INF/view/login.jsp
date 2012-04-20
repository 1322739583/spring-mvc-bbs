<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
	<TITLE>论坛--登录</TITLE>
	<link rel="shortcut icon" href="images/favicon.ico" />
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<Link rel="stylesheet" type="text/css" href="style/style.css" />
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

    <br>
    <div Style="MARGIN: 6px 6px;">※
	<B><a href="grouplistAllData.action">【论坛首页】</a></B>&nbsp;-&nbsp;论坛登录
    </div>

	<!--      用户登录表单        -->	
	<FORM name="loginForm" action="userlogin.action" method="post" class="txt" >
	<table cellspacing="0" cellpadding="0" width="100%" >
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>&nbsp;</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset style="margin:4% 30% 0% 30%;border:1px solid #D4EFF7;padding-bottom:15px"><legend style="padding:0 5px 0 5px;">登录信息</legend>
				<table>
				<tr><td>用户名：</td><td><INPUT class="input" tabIndex="1" type="text" maxLength="50" size="35" name="id"></td></tr>
				<tr><td>密 码：</td><td><INPUT class="input" tabIndex="2" type="password" maxLength="30" size="40" name="passWord"></td></tr>
				<s:if test="hasFieldErrors()"><tr><td colspan="2"><s:fielderror/></td></tr></s:if>
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
