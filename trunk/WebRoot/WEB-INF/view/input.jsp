<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>多种对象类型绑定</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="room.do?method=addname" method="post">
    	<input type="text" name="name" value="roomName"/><br>
    	<input type="text" name="name2" value="roomName2"/><br>
    	<input type="text" name="name3" value="roomName3"/><br>
    	<input type="submit" value="基本类型提交"> 
    </form>
    <hr>
    
     <form action="room.do?method=addnames" method="post">
    	<input type="text" name="name" value="roomName1"/><br>
    	<input type="text" name="name" value="roomName2"/><br>
    	<input type="text" name="name" value="roomName3"/><br>
    	<input type="submit" value="数组提交"> 
    </form>
    <hr>
    
    <form action="room.do?method=add" method="post">
    	<input type="text" name="name" value="roomName"/><br>
    	<input type="submit" value="单一对象属性提交"> 
    </form>
    <hr>
    
    <form action="room.do?method=masterchild" method="post">
    	<input type="text" name="name" value="roomname"/><br>
    	<input type="text" name="desks[0].name" value="deskname0"/><br>
    	<input type="text" name="desks[1].name" value="deskname1"/><br>
    	<input type="submit" value="主表对象提交"> 
    </form>
    <hr> 
    
    <form action="room.do?method=addlist" method="post">
    	<input type="text" name="roomlist[0].name" value="name1"/><br>
    	<input type="text" name="roomlist[1].name" value="name2"/><br>
    	<input type="text" name="roomlist[2].name" value="name3"/><br>
    	<input type="submit" value="List类型提交"> 
    </form>
    <hr>
    
    <form action="room.do?method=addlist" method="post">
    	<input type="text" name="roomlist[0].name" value="name1"/><br>
    	<input type="text" name="roomlist[1].name" value="name2"/><br>
    	<input type="text" name="roomlist[2].name" value="name3"/><br>
    	<input type="submit" value="提交"> 
    </form>
    <hr>
    
     <form action="room.do?method=mutiadd" method="post">
    	<input type="text" name="room.name" value="roomname"/><br>
    	<input type="text" name="desk.name" value="deskname"/><br>
    	<input type="submit" value="两个对象提交"> 
    </form>
    <hr>
    
  </body>
</html>
