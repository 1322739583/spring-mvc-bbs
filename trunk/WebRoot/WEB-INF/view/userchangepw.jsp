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
    <title>�����޸�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
<script type="text/javascript">
function checkpost(){
if(document.regform.oldpassWord.value==""){
    alert("�����벻��Ϊ��");
    return;
 }
 
 if(document.regform.passWord.value==""){
    alert("�����벻��Ϊ��");
    return;
 }
 
  if(document.regform.passWord.value!=document.regform.passWordc.value){
    alert("������������벻һ����");
    return;
 }
 document.regform.submit();
  }
  
  </script>
  
  <body>
   <jsp:include page="banner.jsp"></jsp:include>
   <jsp:include page="showlogin.jsp"></jsp:include>

    <div id="main">
    
    <div Style="MARGIN: 6px 6px;">
	<span style="float:right"><a href="javascript:history.back()">[ ����  ]</a></span>	
	��<B><a href="grouplistAllData.action">����̳��ҳ��</a></B>&nbsp;-&nbsp;
	<B><a href="userinfo.action">���û����ϡ�</a></B>&nbsp;-&nbsp;
	�û������޸�
    </div>

	<s:set name="user" value="#session.user"/>

	<!--      �û����ϱ�        -->	
	<FORM name="regform" action="userupdatePW.action" method="post" class="txt fsize" >
	<input type="hidden" name="id" value="${userid}">
	<table cellspacing="0" cellpadding="0" width="100%" >
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>�û�����</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#F9F9EC">
				<center>  
				<fieldset style="margin:1% 20% 0% 20%;border:1px solid #D4EFF7;padding-bottom:15px;font-size:10px"><legend style="padding:0 5px 0 5px;">������Ϣ</legend>
				<table class="tbf">
				<tr><td>�����룺</td><td><INPUT class="input" tabIndex="1" type="password" maxLength="30" size="40" name="oldpassWord"></td></tr>
				<tr><td>������:</td><td><INPUT class="input" tabIndex="2" type="password" maxLength="30" size="40" name="passWord"></td></tr>
				<tr><td>ȷ�ϣ�</td><td><INPUT class="input" tabIndex="3" type="password" maxLength="30" size="40" name="passWordc"></td></tr>
				</table>
				</fieldset>

				<img src="images/submit.gif"  style="cursor:pointer;margin-top:10px" border="0" onclick="javacript:checkpost()" alt="�ύ"></img>
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
