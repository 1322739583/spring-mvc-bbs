<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>论坛详细设置</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <script src="<%=basePath%>/js/jquery-1.4.4.min.js"></script>
	<link href="<%=basePath%>/css/bbs/style/style.css" rel="stylesheet" type="text/css" />
  </head>

<script type="text/javascript">
$(document).ready(function(){
	  $(":button,:submit").addClass("bbsadminbtn");  
	});

function delmaster(fid,mid){
	location.href='<%=basePath%>'+'bbs/forumset.do?method=deletemaster&id='+mid+'&forumID='+fid;
} 

function showedit(obj){
	if (obj){
		document.getElementById('forums').style.display='none';
		document.getElementById('forumsbtn').style.display='none';
		
		document.getElementById('forum').style.display='block';
		document.getElementById('forumbtn').style.display='block';
	}
	else
	{
		document.getElementById('forums').style.display='block';
		document.getElementById('forumsbtn').style.display='block';
		
		document.getElementById('forumbtn').style.display='none';
		document.getElementById('forum').style.display='none';	
	}
}

function postpm(){
	  $.ajax({
		   type: "POST",
		   url: "bbs/forumset.do?method=updatepermission",
		   data: $("#formpm").serialize(),
		   dataType:"text",
		   success: function(msg){
			   if (msg=="saved"){
			   alert("保存成功");
			   }
			   else{
				 alert("保存失败");
				 location.reload();
			   }
		   },
	  	   error:function(XMLHttpRequest, textStatus, errorThrown){
	  		   alert("保存失败");
	  		   location.reload();
	  	   }
		});
}

</script>

	<body>
		<div class="posti"><div class="homePic"></div>您现在的位置：
		<a href="bbs/forumgroup.do?method=listAll">【后台管理】</a>
		&nbsp;-&nbsp;【版块设置】</div><br/><br/>
		<center>
		
		<c:forEach items="${forum.permission}" var="pms">
			<c:if test="${pms.fpPK.roleID eq 1}"> <c:set var="memberPms" value="${pms}"/> </c:if>
		</c:forEach>
		
		<div id="main">
		
		<table>
		<!-- 版块信息 -->
		<tr><td colspan="2">
			<form action="bbs/forum.do?method=update" method="post">
		    <table width="780" height="123" cellspacing="1"  class="tb1">
		    <tr ><th width="717" align="center">版块设置</th></tr>
		    
		      <tr>
		        <td height="63" valign="top">
		        	<div id="forums">
		        	<p class="fh2" >版块名称：${forum.name}</p>
		          	<p>版块描述：${forum.description}</p>
		          	</div>
		          	<div id="forum" style="display:none">
		          	<input type="hidden" name="id" value="${forum.id}">
		          	<input type="hidden" name="formset" value="1"/>
		        	<div class="linespace">版块名称：<input type="text" name="name" maxlength="50" size="30" value="${forum.name}"></div>
		          	版块描述：<input type="text" name="description" size="70" maxlength="100" value="${forum.description}">
		          	</div>
		          </td>
		      </tr>
		      <tr>
		        <td height="27" style="text-align:center;" valign="top">
		        <div id="forumbtn" style="display:none">
		        <input type="submit" value="保存"><input type="button" onclick="showedit(false)" value="取消" />
		        </div>
		        <div id="forumsbtn"><input type="button" onclick="showedit(true)" value=" 修 改 " /></div>
		        </td>
		      </tr>
			</table>
			</form>
		    <br/>
		    </td>
		</tr>
		
		<!-- 用户权限与版主 -->
		<tr align="left">
			<!-- 用户权限 -->
			<td valign="top">
				<form id="formpm" action="bbs/forumset.do?method=updatepermission" method="post">
				<input type="hidden" name="roleID" value="1">
				<input type="hidden" name="forumID" value="${forum.id}">
				<table width="300" cellspacing="1" class="tb2">
				<tr><th colspan="2" align="center">普通用户权限设置</th></tr>
				<tr class="trtitle" align="center"><td > 功能 </td><td>是否允许</td></tr>
				<tr><td> 浏览列表 </td><td><input type="checkbox" name="viewList" value="true" ${memberPms.viewList?'checked':''}/></td></tr>
				<tr><td> 浏览明细 </td><td><input type="checkbox" name="viewDetail" value="true" ${memberPms.viewDetail?'checked':''}/></td></tr>
				<tr><td> 新增帖子 </td><td><input type="checkbox" name="addTopic" value="true" ${memberPms.addTopic?'checked':''} /></td></tr>
				<tr><td> 修改帖子</td><td><input type="checkbox" name="modifyTopic" value="true" ${memberPms.modifyTopic?'checked':''}/></td></tr>
				<tr><td> 删除帖子</td><td><input type="checkbox" name="deleteTopic" value="true" ${memberPms.deleteTopic?'checked':''}/></td></tr>
				<tr><td> 回复帖子 </td><td><input type="checkbox" name="replyTopic" value="true" ${memberPms.replyTopic?'checked':''}/></td></tr>
				<tr><td colspan="2" align="center"><input type="button" id="savepm" onclick="postpm();" value=" 保 存 " /></td></tr>
				</table>
				</form>
				
				<br/>
			</td>
			
			<!-- 版主 -->
			<td valign="top">
				<form action="bbs/forumset.do?method=addmaster" method="post">
				<input type="hidden" name="forumID" value="${forum.id}">
				<table cellspacing="1" class="tb2" width="300">
				  <tr>
				    <th colspan="2">版主管理</th>
				  </tr>
				  <tr class="trtitle"><td align="center">版主</td><td align="center">操作</td></tr>
				  <c:forEach items="${forum.masters}" var="master">
				  		<tr height="5px">
				  		<td>${master.userID}</td>
				    	<td><input type="button" onclick="delmaster('${forum.id}','${master.id}')" value="删除"/></td>
				    	</tr>
				  </c:forEach>
				  
				  <tr><td><input type="text" name="userID" size="15"/></td><td><input type="submit" value="添加" /></td></tr>
				</table>
				</form>
				
			<br/>
			</td>
		
		</tr>
		
		<tr><td colspan="2" align="center"><br/><a href="bbs/forumgroup.do?method=listAll"><img src="css/bbs/images/return.gif" border="0"></a></td></tr>
		</table>
	</div>
	

	</center>
 </body>
</html>
