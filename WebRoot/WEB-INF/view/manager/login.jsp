<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��̳��̨��¼</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="manager/style.css" />
  </head>
  
  <body>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p><br />
	</p>
	<div id="main" >
	 <form action="manager/usersyslogin.action" method="post">
	  <table width="314" cellspacing="1" class="tb" align="center">
	    <tr>
	      <th colspan="2" scope="col">��̳��̨��¼</th>
	    </tr>
	    <tr>
	      <td colspan="2" align="center"><table width="264" >
	        <tr>
	          <td width="72" align="right" scope="col">�û�����</td>
	          <td width="176" scope="col"><input type="text" name="id"/></td>
	          </tr>
	        <tr>
	          <td align="right">���룺</td>
	          <td><input type="password" name="passWord" /></td>
	          </tr>
	        </table>
	        <br />
	       
	          <input type="submit"  value=" �� �� " /> 
	          <input type="reset"  value=" �� �� " />
	          <br />
	          <br />
	       
	        </td>
	    </tr>
	  </table>
	   </form>
	</div>
  </body>
</html>
