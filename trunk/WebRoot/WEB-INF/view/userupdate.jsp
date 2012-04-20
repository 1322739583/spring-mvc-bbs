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
    <title>用户资料修改</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
<script type="text/javascript">
function checkpost(){
 document.regform.submit();
  }
  
  </script>
  
  <body>
   <jsp:include page="banner.jsp"></jsp:include>
   <jsp:include page="showlogin.jsp"></jsp:include>

    <div id="main">
    
    <div Style="MARGIN: 6px 6px;"><span style="float:right"><a href="javascript:history.back()">[ 返回  ]</a></span>
   	※<B><a href="grouplistAllData.action">【论坛首页】</a></B>&nbsp;-&nbsp;
	<B><a href="userinfo.action">【用户资料】</a></B>&nbsp;-&nbsp; 
	用户资料修改
    </div>

	<s:set name="user" value="#session.user"/>

	<!--      用户资料表单        -->	
	<FORM name="regform" action="userupdate.action" method="post" class="txt fsize" >
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
				<tr><td>E-mail:</td><td><INPUT class="input" tabIndex="2" type="text" maxLength="30" size="40" name="email" value="${user.email}"></td></tr>
				<tr><td>性别:</td><td><input type="radio" name="sex" value="TRUE" <s:if test="#user.sex">checked</s:if> >男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="FALSE" <s:if test="#user.sex==0">checked</s:if> >女</td></tr>
				</table>
				</fieldset>
				
				
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">请选择头像</legend>
				<table>
				<tr><td><img src="images/face/a.jpeg"/><input type="radio" name="face" value="a.jpeg" <s:if test="#user.face=='a.jpeg'">checked="checked"</s:if> >
					<img src="images/face/b.jpeg"/><input type="radio" name="face" value="b.jpeg" <s:if test="#user.face=='b.jpeg'">checked="checked"</s:if> >
					<img src="images/face/c.jpeg"/><input type="radio" name="face" value="c.jpeg" <s:if test="#user.face=='c.jpeg'">checked="checked"</s:if> >
					<img src="images/face/d.jpeg"/><input type="radio" name="face" value="d.jpeg" <s:if test="#user.face=='d.jpeg'">checked="checked"</s:if> >
					<img src="images/face/e.jpeg"/><input type="radio" name="face" value="e.jpeg" <s:if test="#user.face=='e.jpeg'">checked="checked"</s:if> >
					<BR/>
					<img src="images/face/f.jpeg"/><input type="radio" name="face" value="f.jpeg" <s:if test="#user.face=='f.jpeg'">checked="checked"</s:if> >
					<img src="images/face/g.jpeg"/><input type="radio" name="face" value="g.jpeg" <s:if test="#user.face=='g.jpeg'">checked="checked"</s:if> >
					<img src="images/face/h.jpeg"/><input type="radio" name="face" value="h.jpeg" <s:if test="#user.face=='h.jpeg'">checked="checked"</s:if> >
					<img src="images/face/i.jpeg"/><input type="radio" name="face" value="i.jpeg" <s:if test="#user.face=='i.jpeg'">checked="checked"</s:if> >
					<img src="images/face/j.jpeg"/><input type="radio" name="face" value="j.jpeg" <s:if test="#user.face=='j.jpeg'">checked="checked"</s:if> >
					<BR/>
					<img src="images/face/k.jpeg"/><input type="radio" name="face" value="k.jpeg" <s:if test="#user.face=='k.jpeg'">checked="checked"</s:if> > 
					<img src="images/face/l.jpeg"/><input type="radio" name="face" value="l.jpeg" <s:if test="#user.face=='l.jpeg'">checked="checked"</s:if> >
					<img src="images/face/m.jpeg"/><input type="radio" name="face" value="m.jpeg" <s:if test="#user.face=='m.jpeg'">checked="checked"</s:if> >
					<img src="images/face/n.jpeg"/><input type="radio" name="face" value="n.jpeg" <s:if test="#user.face=='n.jpeg'">checked="checked"</s:if> >
					<img src="images/face/o.jpeg"/><input type="radio" name="face" value="o.jpeg" <s:if test="#user.face=='o.jpeg'">checked="checked"</s:if> >
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
