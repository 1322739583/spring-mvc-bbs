<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>密码修改</title>
    <%@ include file="/common.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  
<script type="text/javascript">
function checkpost(){
if(document.regform.oldpassWord.value==""){
    alert("旧密码不能为空");
    return;
 }
 
 if(document.regform.passWord.value==""){
    alert("新密码不能为空");
    return;
 }
 
  if(document.regform.passWord.value!=document.regform.passWordc.value){
    alert("两次输入的密码不一样。");
    return;
 }
 document.regform.submit();
  }
  
  </script>
  
  <body>
   <jsp:include page="banner.jsp"></jsp:include>
   <jsp:include page="showlogin.jsp"></jsp:include>

    <div id="main">
    
    <div class="posti">
	<span style="float:right"><a href="javascript:history.back()">[ 返回  ]</a></span>	
	※<B><a href="forumgroup.do?method=listForumGroups">【论坛首页】</a></B>&nbsp;-&nbsp;
	<B><a href="user.do?method=info">【用户资料】</a></B>&nbsp;-&nbsp;
	用户密码修改
    </div>

	<!--      用户资料表单        -->	
	<FORM name="regform" action="user.do?method=updatepw" method="post" class="txt fsize" >
	<input type="hidden" name="id" value="${userid}">
	<table cellspacing="0" cellpadding="0" width="100%" >
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>用户资料</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">基本信息</legend>
				<table class="tbf">
				<tr><td>旧密码：</td><td><INPUT class="input" tabIndex="1" type="password" maxLength="30" size="40" name="oldpassWord"></td></tr>
				<tr><td>新密码:</td><td><INPUT class="input" tabIndex="2" type="password" maxLength="30" size="40" name="passWord"></td></tr>
				<tr><td>确认：</td><td><INPUT class="input" tabIndex="3" type="password" maxLength="30" size="40" name="passWordc"></td></tr>
				</table>
				</fieldset>

				<img src="images/submit.gif"  style="cursor:pointer;margin-top:10px" border="0" onclick="javacript:checkpost()" alt="提交"></img>
				</center>
				<br>
				<br>
		       </td>
		    </tr>
	</table>
	</form>
	
	
	<%@include file="copyright.jsp"%>
   </div> 
  </body>
</html>
