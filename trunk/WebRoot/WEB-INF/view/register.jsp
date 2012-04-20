<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="images/favicon.ico" />
    <title>用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
<script type="text/javascript">
function checkpost(){
   if(document.regform.id.value==""){
    alert("用户名不能为空");
    return;
 }
 if(document.regform.passWord.value==""){
    alert("密码不能为空");
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

	 <div class="posti">
	 	<B><a href="forumgroup.do?method=listForumGroup">【论坛首页】</a></B>&nbsp;-&nbsp;论坛注册
	 </div>
	
    <div id="main">
	<!--      用户注册表单        -->	
	<FORM name="regform" action="user.do?method=register" method="post" class="txt fsize" >
	<input type="hidden" name="action" value="add">		
	<table cellspacing="0" cellpadding="0" width="100%" >
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>注册信息</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">基本信息</legend>
				<table class="tbf">
				<tr ><td>用户ID：</td><td><INPUT class="input" tabIndex="1" type="text" maxLength="50" size="35" name="id"></td></tr>
				<tr><td>密 码：</td><td><INPUT class="input" tabIndex="2" type="password" maxLength="30" size="40" name="passWord"></td></tr>
				<tr><td>确认密码：</td><td><INPUT class="input" tabIndex="2" type="password" maxLength="30" size="40" name="passWordc"></td></tr>
				<tr><td>E-mail:</td><td><INPUT class="input" tabIndex="2" type="text" maxLength="30" size="40" name="email"></td></tr>
				<tr><td>性别:</td><td><input type="radio" name="sex" value="true" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="false">女</td></tr>
				</table>
				</fieldset>
				
				
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">请选择头像</legend>
				<table>
				<tr><td><img src="images/face/a.jpeg"/><input type="radio" name="face" value="a.jpeg" checked="checked">
		<img src="images/face/b.jpeg"/><input type="radio" name="face" value="b.jpeg">
		<img src="images/face/c.jpeg"/><input type="radio" name="face" value="c.jpeg">
		<img src="images/face/d.jpeg"/><input type="radio" name="face" value="d.jpeg">
		<img src="images/face/e.jpeg"/><input type="radio" name="face" value="e.jpeg">
		<BR/>
		<img src="images/face/f.jpeg"/><input type="radio" name="face" value="f.jpeg">
		<img src="images/face/g.jpeg"/><input type="radio" name="face" value="g.jpeg">
		<img src="images/face/h.jpeg"/><input type="radio" name="face" value="h.jpeg">
		<img src="images/face/i.jpeg"/><input type="radio" name="face" value="i.jpeg">
		<img src="images/face/j.jpeg"/><input type="radio" name="face" value="j.jpeg">
		<BR/>
		<img src="images/face/k.jpeg"/><input type="radio" name="face" value="k.jpeg"> 
		<img src="images/face/l.jpeg"/><input type="radio" name="face" value="l.jpeg">
		<img src="images/face/m.jpeg"/><input type="radio" name="face" value="m.jpeg">
		<img src="images/face/n.jpeg"/><input type="radio" name="face" value="n.jpeg">
		<img src="images/face/o.jpeg"/><input type="radio" name="face" value="o.jpeg">
		<br/></td></tr>
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
