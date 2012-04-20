<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>用户资料修改</title>
    <%@include file="/common.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
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
    
    <div class="posti"><span style="float:right"><a href="javascript:history.back()">[ 返回  ]</a></span>
   	※<B><a href="forumgroup.do?method=listForumGroups">【论坛首页】</a></B>&nbsp;-&nbsp;
	<B><a href="user.do?method=info">【用户资料】</a></B>&nbsp;-&nbsp; 
	用户资料修改
    </div>

	<!--      用户资料表单        -->	
	<FORM name="regform" action="user.do?method=update" method="post" class="txt fsize" >
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
				<tr><td>性别:</td><td><input type="radio" name="sex" value="TRUE" <c:if test="${user.sex}">checked</c:if> >男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="FALSE" <c:if test="${user.sex==0}">checked</c:if> >女</td></tr>
				</table>
				</fieldset>
				
				
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">请选择头像</legend>
				<table>
				<tr><td><img src="images/face/a.jpeg"/><input type="radio" name="face" value="a.jpeg" <c:if test="${user.face eq 'a.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/b.jpeg"/><input type="radio" name="face" value="b.jpeg" <c:if test="${user.face eq 'b.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/c.jpeg"/><input type="radio" name="face" value="c.jpeg" <c:if test="${user.face eq 'c.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/d.jpeg"/><input type="radio" name="face" value="d.jpeg" <c:if test="${user.face eq 'd.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/e.jpeg"/><input type="radio" name="face" value="e.jpeg" <c:if test="${user.face eq 'e.jpeg'}">checked="checked"</c:if> >
					<BR/>
					<img src="images/face/f.jpeg"/><input type="radio" name="face" value="f.jpeg" <c:if test="${user.face eq 'f.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/g.jpeg"/><input type="radio" name="face" value="g.jpeg" <c:if test="${user.face eq 'g.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/h.jpeg"/><input type="radio" name="face" value="h.jpeg" <c:if test="${user.face eq 'h.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/i.jpeg"/><input type="radio" name="face" value="i.jpeg" <c:if test="${user.face eq 'i.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/j.jpeg"/><input type="radio" name="face" value="j.jpeg" <c:if test="${user.face eq 'j.jpeg'}">checked="checked"</c:if> >
					<BR/>
					<img src="images/face/k.jpeg"/><input type="radio" name="face" value="k.jpeg" <c:if test="${user.face eq 'k.jpeg'}">checked="checked"</c:if> > 
					<img src="images/face/l.jpeg"/><input type="radio" name="face" value="l.jpeg" <c:if test="${user.face eq 'l.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/m.jpeg"/><input type="radio" name="face" value="m.jpeg" <c:if test="${user.face eq 'm.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/n.jpeg"/><input type="radio" name="face" value="n.jpeg" <c:if test="${user.face eq 'n.jpeg'}">checked="checked"</c:if> >
					<img src="images/face/o.jpeg"/><input type="radio" name="face" value="o.jpeg" <c:if test="${user.face eq 'o.jpeg'}">checked="checked"</c:if> >
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
