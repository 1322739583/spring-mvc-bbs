<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>论坛后台登录</title>
    
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
	      <th colspan="2" scope="col">论坛后台登录</th>
	    </tr>
	    <tr>
	      <td colspan="2" align="center"><table width="264" >
	        <tr>
	          <td width="72" align="right" scope="col">用户名：</td>
	          <td width="176" scope="col"><input type="text" name="id"/></td>
	          </tr>
	        <tr>
	          <td align="right">密码：</td>
	          <td><input type="password" name="passWord" /></td>
	          </tr>
	        </table>
	        <br />
	       
	          <input type="submit"  value=" 提 交 " /> 
	          <input type="reset"  value=" 重 置 " />
	          <br />
	          <br />
	       
	        </td>
	    </tr>
	  </table>
	   </form>
	</div>
  </body>
</html>
