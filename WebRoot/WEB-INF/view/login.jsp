<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<HTML>
<HEAD>
	<TITLE>��̳--��¼</TITLE>
	<%@ include file="/common.jsp"%>
</HEAD>

<script language="javascript">
function checkpost() {
 if(document.loginForm.id.value==""){
    alert("�û�������Ϊ��");
    return;
 }
 if(document.loginForm.passWord.value==""){
    alert("���벻��Ϊ��");
    return;
 }
 
 document.loginForm.submit();
}
</script>

<BODY>
    <jsp:include page="banner.jsp"></jsp:include>
    <jsp:include page="showlogin.jsp"></jsp:include>
    
	<div class="position">
	    <a href="forumgroup.do?method=listForumGroups">����̳��ҳ��</a>&nbsp;&nbsp;-&nbsp;&nbsp;��̳��¼
	</div>

	<!--      �û���¼��        -->	
	<FORM name="loginForm" action="user.do?method=login" method="post"  >
	<table cellspacing="1" class="tb">
		    <tr>
		      <th>&nbsp;</th>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset><legend>��¼��Ϣ</legend>
				<table>
				<tr><td>�û�����</td><td><INPUT tabIndex="1" type="text" maxLength="30" size="35" name="id"></td></tr>
				<tr><td>�� �룺</td><td><INPUT tabIndex="2" type="password" maxLength="30" size="35" name="passWord"></td></tr>
				</table>
				</fieldset>
				<img src="images/login.gif"  style="cursor:pointer;margin-top:5px" border="0" onclick="javacript:checkpost()" alt="�ύ"></img>
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
