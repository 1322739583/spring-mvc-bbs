<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>版块管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script src="script/jquery-1.4.4.min.js"></script>
	<link href="style/managerstyle.css" rel="stylesheet" type="text/css" />
  </head>
  
  <script type="text/javascript">
  $(document).ready(function(){
	  $(":button,:submit").addClass("bbsadminbtn");
	});
  
  
  //新增组
  function showgrp(show){
  	if (show){
  		$("#newgrpshow").hide();
  		$("#newgrp").show();
  	}
  	else{
  		$("#newgrp").hide();
  		$("#newgrpshow").show();
  	}
  }
  
  //修改组
  function showedtgrp(obj,show){
 	if (show){
 		$("#fgshow"+obj).hide();
  		$("#fgedit"+obj).show();
 	}
 	else{
 		$("#fgshow"+obj).show();
  		$("#fgedit"+obj).hide();
 	}	
  }
  
  //新增版块
   function showf(obj,show){
 	if (show){
 		$("#newf"+obj).show();
  		$("#newfshow"+obj).hide();
 	}
 	else{
 		$("#newf"+obj).hide();
  		$("#newfshow"+obj).show();
 	}	
  }
  
  //修改版块
   function showfed(obj,show){
 	if (show){
 		$("#fshow"+obj).hide();
  		$("#fedit"+obj).show();
 	}
 	else{
 		$("#fshow"+obj).show();
  		$("#fedit"+obj).hide();
 	}	
  }  
  
  function delgroup(obj){
  	if(confirm('记录删除后将无法恢复，确定要删除？')){
  	  location.href='<%=basePath%>'+'forumgroup.do?method=delete&id='+obj;
  	}
  }
  
  function delforum(obj){
  	if(confirm('删除板块会删除板块下面所有帖子及回复，确定要删除？')){
  	  location.href='<%=basePath%>'+ 'forum.do?method=delete&id='+obj;
  	}
  }
  
  function checkf(obj){
    if(obj.name.value==''){
    	alert('名称不能为空');
    	return false;
 	}
 	
 	return true;
}
  
 function forumset(obj){
   location.href='<%=basePath%>'+'forumset.do?method=list&forumID='+obj;
 } 
  
  </script>
   
  
  <body>
    <center>
    <div class="tit">论坛后台管理</div>
	<div class="func">
	<span style="float:right"> <a href="manager/userlogout.action">退出</a></span>
	<span><a href="manager/grouplistAll.action">版块管理</a>&nbsp; &nbsp; <a href="manager/userSet.jsp">用户管理</a></span>
	</div> 

	<div class="manager">
		<c:forEach items="${forumGrps}" var="fg">
		
			<!-- 版块组 -->
			<div class="group">
				<!-- 显示部分 -->
				<div id="fgshow${fg.id}">
				<div class="floatright"><input type="button" value="修改" onclick="showedtgrp(${fg.id},true)"><input type="button" value="删除" onclick="delgroup(${fg.id})"></div>
		    	${fg.name}
		    	</div>
		    	
		    	<!-- 修改部分 -->
		    	<form action="forumgroup.do?method=update"  onsubmit="return checkf(this);" method="post">
		    	<input type="hidden" name="order" value="${fg.order}">
		    	<div id="fgedit${fg.id}"  class="hide">
		    		<input type="hidden" name="id" value="${fg.id}">
		    		<input type="text" name="name" size="40" maxlength="20" value="${fg.name}"/> <input type="submit" value="保存"/><input type="button" value="取消" onclick="showedtgrp(${fg.id},false)">
		    	</div>
		    	</form>
			</div>
			
			<!-- 版块列表 -->	
			<div class="forums">
				<c:forEach items="${fg.forums}" var="f">
				<div class="forum">
					 <!-- 显示部分 -->
			    	<div id="fshow${f.id}">
				    	<div class="floatright"><input type="button" value="修改"  onclick="showfed(${f.id},true)"><input type="button" value="删除" onclick="delforum(${f.id})"><input type="button" onclick="forumset(${f.id})" value="版块设置"></div>
				    	<span class="fh2">${f.name}</span><br>描述：${f.description}
			    	</div>
			    	<!-- 修改部分 -->
			    	<div id="fedit${f.id}" style="display:none">
				    	<form action="forum.do?method=update"  method="post"  onsubmit="return checkf(this);" style="margin:0px" >
				    	<input type="hidden" name="id" value="${f.id}">
				    	<input type="hidden" name="forumGroup.id" value="${fg.id}">
			    		版块名称：<input type="text" name="name" size="30"  maxlength="20"  value="${f.name}"/><br> 
			    		版块描述：<input type="text" name="description" size="70"  maxlength="100" value="${f.description}"/><br>
			    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showfed(${f.id},false)">
			    		</form>			    	
			    	</div>
			    </div>
				</c:forEach>
				
				<!-- 新增子版块 -->
				<div id="newfshow${fg.id}"><input type="button" value="新增子版块" onclick="showf(${fg.id},true)"></div>
		    	<div id="newf${fg.id}" style="display:none">
		    		<form action="forum.do?method=save" style="margin:0px" method="post"  onsubmit="return checkf(this);">
		    		<input type="hidden" name="forumGroup.id" value="${fg.id}">
		    		版块名称：<input type="text" name="name"  maxlength="20" size="30"><br> 
		    		版块描述：<input type="text" name="description"  maxlength="100" size="60"><br>
		    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showf(${fg.id},false)">
		    		</form>
		    	</div>
		    	
			</div>
		
		</c:forEach>
	
	
		<!-- 新增版块组 -->
		<div class="newgroup">
			<div id="newgrpshow"><input type="button" value="新增版块组" onclick="showgrp(true);"></div>
			<form name="newgroupa" action="forumgroup.do?method=save" method="post"  onsubmit="return checkf(this);">
			<div id="newgrp" class="hide">版块组名称：<input type="text" name="name"  maxlength="20" size="40"/> <input type="submit" value="保存"/><input type="button" value="取消" onclick="showgrp(false);"></div>
			</form>
		</div>
	
	</div>
  
  	<div class="copyright">版权所有</div>  
</center>  
   
  </body> 
</html>
