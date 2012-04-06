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
	<script src="<%=basePath%>/js/jquery-1.4.4.min.js"></script>
	<link href="<%=basePath%>css/bbs/style/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <script type="text/javascript">
  $(document).ready(function(){
	  $(":button,:submit").addClass("bbsadminbtn");
	});
  
  
  //新增组
  function showgrp(show){
  	if (show){
  		document.getElementById('newgrp').style.display='block';
  		document.getElementById('newgrpshow').style.display='none';
  	}
  	else{
  		document.getElementById('newgrp').style.display='none';
  		document.getElementById('newgrpshow').style.display='block';
  	}
  }
  
  //修改组
  function showedtgrp(obj,show){
 	if (show){
 		document.getElementById('fgshow'+obj).style.display='none';
 		document.getElementById('fgedit'+obj).style.display='block';
 	}
 	else{
 		document.getElementById('fgshow'+obj).style.display='block';
 		document.getElementById('fgedit'+obj).style.display='none';
 	}	
  }
  
  //新增版块
   function showf(obj,show){
 	if (show){
 		document.getElementById('newf'+obj).style.display='block';
 		document.getElementById('newfshow'+obj).style.display='none';
 	}
 	else{
 		document.getElementById('newf'+obj).style.display='none';
 		document.getElementById('newfshow'+obj).style.display='block';
 	}	
  }
  
  //修改版块
   function showfed(obj,show){
 	if (show){
 		document.getElementById('fshow'+obj).style.display='none';
 		document.getElementById('fedit'+obj).style.display='block';
 	}
 	else{
 		document.getElementById('fshow'+obj).style.display='block';
 		document.getElementById('fedit'+obj).style.display='none';
 	}	
  }  
  
  function delgroup(obj){
  	if(confirm('记录删除后将无法恢复，确定要删除？')){
  	  location.href='<%=basePath%>'+'/bbs/forumgroup.do?method=delete&id='+obj;
  	}
  }
  
  function delforum(obj){
  	if(confirm('删除板块会删除板块下面所有帖子及回复，确定要删除？')){
  	  location.href='<%=basePath%>'+ '/bbs/forum.do?method=delete&id='+obj;
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
   location.href='<%=basePath%>'+'/bbs/forumset.do?method=list&forumID='+obj;
 } 
  
  </script>
   
  
  <body>
    <div class="posti"><div class="homePic"></div>您现在的位置：【论坛后台管理】</div><br/><br/>
    <center>
    <table width="780" cellspacing="1" cellpadding="0" class="tb1">
    <c:forEach items="${forumGrps}" var="fg">
    	<c:set value="1" var="formRows"/>
    	<!-- 标题行 -->
		<tr bgcolor="#A6C6F9">
			<th colspan="2" class="fh1">
				<!-- 显示部分 -->
				<div id="fgshow${fg.id}">
				<div class="flrt"><input type="button" value="修改" onclick="showedtgrp(${fg.id},true)"><input type="button" value="删除" onclick="delgroup(${fg.id})"></div>
		    	${fg.name}
		    	</div>
		    	<!-- 修改部分 -->
		    	<form action="bbs/forumgroup.do?method=update"  onsubmit="return checkf(this);" style="margin:0px" method="post">
		    	<input type="hidden" name="order" value="${fg.order}">
		    	<div id="fgedit${fg.id}" style="display:none">
		    		<input type="hidden" name="id" value="${fg.id}">
		    		<input type="text" name="name" size="40" maxlength="20" value="${fg.name}"/> <input type="submit" value="保存"/><input type="button" value="取消" onclick="showedtgrp(${fg.id},false)">
		    	</div>
		    	</form>
			</th>  
		</tr> 
		
		<!-- 版块数据行,分有数据和没数据两种情况，有数据时，分第一列和其它列两种情况 -->
		<c:if test="${fn:length(fg.forums) eq 0}">
		<tr>
			<td width="100">
			</td>
			
			<td>  
		    	<div id="newfshow${fg.id}"><input type="button" value="新增子版块" onclick="showf(${fg.id},true)"></div>
		    	<div id="newf${fg.id}" style="display:none">
		    		<form action="bbs/forum.do?method=save" style="margin:0px" method="post"  onsubmit="return checkf(this);">
		    		<input type="hidden" name="forumGroupID" value="${fg.id}">
		    		版块名称：<input type="text" name="name"  maxlength="20" size="30"><br> 
		    		版块描述：<input type="text" name="description"  maxlength="100" size="60"><br>
		    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showf(${fg.id},false)">
		    		</form>
		    	</div>
		    </td>
	    </tr>  
		</c:if>

		<c:if test="${fn:length(fg.forums)>0}">
			<c:forEach items="${fg.forums}" var="f">
			<c:if test="${formRows eq '1'}">
				  	<tr>
				    <td width="100" rowspan="${fn:length(fg.forums)+1}"></td>
			    	<td >
			    		<!-- 显示部分 -->
				    	<div id="fshow${f.id}">
					    	<div class="flrt"><input type="button" value="修改"  onclick="showfed(${f.id},true)"><input type="button" value="删除" onclick="delforum(${f.id})"><input type="button" onclick="forumset(${f.id})" value="版块设置"></div>
					    	<span class="fh2">${f.name}</span><br>描述：${f.description}
				    	</div>
				    	<!-- 修改部分 -->
				    	<div id="fedit${f.id}" style="display:none">
					    	<form action="bbs/forum.do?method=update"  method="post"  onsubmit="return checkf(this);" style="margin:0px">
					    	<input type="hidden" name="id" value="${f.id}">
				    		版块名称：<input type="text" name="name" size="30"  maxlength="20" value="${f.name}"/><br> 
				    		版块描述：<input type="text" name="description" size="70"  maxlength="100" value="${f.description}"/><br>
				    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showfed(${f.id},false)">
				    		</form>			    	
				    	</div>
			    	</td>
					</tr>
			</c:if>
			<c:if test="${formRows ne '1'}">  		    
			    <tr> 
			    	<td >
			    	<!-- 显示部分 -->
			    	<div id="fshow${f.id}">
				    	<div class="flrt"><input type="button" value="修改"  onclick="showfed(${f.id},true)"><input type="button" value="删除" onclick="delforum(${f.id})"><input type="button" onclick="forumset(${f.id})" value="版块设置"></div>
				    	<span class="fh2">${f.name}</span><br>描述：${f.description}
			    	</div>
			    	<!-- 修改部分 -->
			    	<div id="fedit${f.id}" style="display:none">
				    	<form action="bbs/forum.do?method=update"  method="post"  onsubmit="return checkf(this);" style="margin:0px" >
				    	<input type="hidden" name="id" value="${f.id}">
			    		版块名称：<input type="text" name="name" size="30"  maxlength="20"  value="${f.name}"/><br> 
			    		版块描述：<input type="text" name="description" size="70"  maxlength="100" value="${f.description}"/><br>
			    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showfed(${f.id},false)">
			    		</form>			    	
			    	</div>
			    	</td>
				</tr>
			</c:if>	
			<c:set value="2" var="formRows"/>
			</c:forEach>
			    <tr>
				    <td>
				    	<!-- 显示部分 -->
				    	<div id="newfshow${fg.id}" style="width:500px;"><input type="button" value="新增子版块" onclick="showf(${fg.id},true)"></div>
				    	<!-- 新增部分 -->
				    	<div id="newf${fg.id}" style="display:none">
				    		<form action="bbs/forum.do?method=save" method="post" onsubmit="return checkf(this);" style="margin:0px" >
				    		<input type="hidden" name="forumGroupID" value="${fg.id}">
				    		版块名称：<input type="text" name="name"  maxlength="20" size="30"><br> 
				    		版块描述：<input type="text" name="description"  maxlength="100" size="60"><br>
				    		<input type="submit" value="保存"/> <input type="button" value="取消" onclick="showf(${fg.id},false)">
				    		</form>
				    	</div>
				    </td>
			    </tr> 
		</c:if>
    </c:forEach>
    
   	<!-- 新增版块组行 -->
    <tr>
	    <td colspan="2"> 
		    <div id="newgrpshow"><input type="button" value="新增版块组" onclick="showgrp(true);"></div>
		    <form name="newgroupa" action="bbs/forumgroup.do?method=save" method="post"  onsubmit="return checkf(this);">
		    <div id="newgrp" style="display:none">版块组名称：<input type="text" name="name"  maxlength="20" size="40"/> <input type="submit" value="保存"/><input type="button" value="取消" onclick="showgrp(false);"></div>
		    </form>
	    </td>
    </tr>
  </table>
  
</center>  
   
  </body> 
</html>
