<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="manager/style.css">

  </head> 
  
  <script type="text/javascript">
   function usearch(flag){
   	var con=document.getElementById('usearch').value;
   	 location.href='<%=basePath%>manager/userlist.action?cdn='+con+'&like='+flag;
   }
  
  </script>
  
  <body>

	<center>
 	<div class="tit">��̳��̨����</div>
	<table width="782" border="0" cellspacing="0" bgcolor="#A6C6F9" style="margin-bottom:15px;">
	<tr><td>
	<div class="fnc">
	<span style="float:right"> <a href="manager/userlogout.action">�˳�</a></span>
	<span><a href="manager/grouplistAll.action">������</a>&nbsp; &nbsp; <a href="manager/userSet.jsp">�û�����</a></span>
	</div> 
	</td></tr>
	</table>
	
	<div id="main">
	<p>�û���/���䣺
	  <input type="text" id="usearch" />
	  <input type="button" value=" �� �� " onclick="usearch(0)"/>
	  <input type="button" value="ģ������ " onclick="usearch(1)"/>
	  <br/>
	</p>

	<table width="770" cellspacing="1" class="tb">
	  <tr>
	    <th scope="col">�û�ID</th>
	    <th width="80" scope="col">�Ա�</th>
	    <th width="210" scope="col">����</th>
	    <th width="140" scope="col">ע������</th>
	    <th width="120" scope="col">����/����</th>
	  </tr>
	  
	  <s:iterator value="userList" var="u"> 
		  <tr align="center">
		    <td>${u.id}</td>
		    <td><s:if test="sex">��</s:if><s:else>Ů</s:else></td>
		    <td>${u.email}</td>
		    <td>${u.regDate}</td>
		    <td>
		    <span  class="lbtn">
		    <s:if test="forbidden"><a href="manager/userlock.action?id=${u.id}&forbidden=false&cdn=${cdn}&like=${like}">����</a></s:if>
		    <s:else><a href="manager/userlock.action?id=${u.id}&forbidden=true&cdn=${cdn}&like=${like}">����</a></s:else>
		    </span>
		    </td>
		  </tr>
	  </s:iterator>
	</table>
	<br />
	<br />
	<br />
	<div class="fot">��Ȩ����</div>
	</div>
	
	
	</center>


  </body>
</html>
