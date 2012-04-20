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
    <script src="<%=basePath%>/script/jquery-1.4.4.min.js"></script>
	<link href="style/managerstyle.css" rel="stylesheet" type="text/css" />
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

function postpm(obj){
	  $.ajax({
		   type: "POST",
		   url: "forumset.do?method=updatepermission",
		   data: $("#"+obj).serialize(),
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
		<center>
		<div class="tit">论坛后台管理</div>
		<table width="782" border="0" cellspacing="0" bgcolor="#A6C6F9" style="margin-bottom:15px;">
		<tr><td>
		<div class="fnc">
		<span class="floatrigth"> <a href="manager/userlogout.action">退出</a></span> 
		<span><a href="forumgroup.do?method=listAll">版块管理</a>&nbsp; &nbsp; <a href="manager/userSet.jsp">用户管理</a></span>
		</div> 
		</td></tr>
		</table>
		
		<c:forEach items="${forum.permission}" var="pms">
			<c:if test="${pms.fpPK.roleID eq 1}"> <c:set var="memberPms" value="${pms}"/> </c:if>
			<c:if test="${pms.fpPK.roleID eq 0}"> <c:set var="custmPms" value="${pms}"/></c:if>
		</c:forEach>
		
		<div id="main">
		
		<table>
		<!-- 版块信息 -->
		<tr><td colspan="2">
			<form action="forum.do?method=update" method="post">
		    <table width="780" height="123" cellspacing="1"  class="tbpemission">
		    <tr ><th width="717" align="center">版块设置</th></tr>
		    
		      <tr>
		        <td height="63" valign="top" style="text-align:left;">
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
				<form id="formpmcustm" action="forumset.do?method=updatepermission" method="post">
				<input type="hidden" name="fpPK.roleID" value="0">
				<input type="hidden" name="fpPK.forumID" value="${forum.id}">
				<table width="300" cellspacing="1" class="tbpemission">
				<tr><th colspan="2" align="center">游客权限设置</th></tr>
				<tr class="trtitle" align="center"><td > 功能 </td><td>是否允许</td></tr>
				<tr><td> 浏览列表 </td><td><input type="checkbox" name="viewList" value="true" ${custmPms.viewList?'checked':''}/></td></tr>
				<tr><td> 浏览明细 </td><td><input type="checkbox" name="viewDetail" value="true" ${custmPms.viewDetail?'checked':''}/></td></tr>
				<tr><td colspan="2" align="center"><input type="button" id="savepm" onclick="postpm('formpmcustm');" value=" 保 存 " /></td></tr>
				</table>
				</form>
				<br/>
			
			
				<form id="formpm" action="forumset.do?method=updatepermission" method="post">
				<input type="hidden" name="fpPK.roleID" value="1">
				<input type="hidden" name="fpPK.forumID" value="${forum.id}">
				<table width="300" cellspacing="1" class="tbpemission">
				<tr><th colspan="2" align="center">普通用户权限设置</th></tr>
				<tr class="trtitle" align="center"><td > 功能 </td><td>是否允许</td></tr>
				<tr><td> 浏览列表 </td><td><input type="checkbox" name="viewList" value="true" ${memberPms.viewList?'checked':''}/></td></tr>
				<tr><td> 浏览明细 </td><td><input type="checkbox" name="viewDetail" value="true" ${memberPms.viewDetail?'checked':''}/></td></tr>
				<tr><td> 新增帖子 </td><td><input type="checkbox" name="addTopic" value="true" ${memberPms.addTopic?'checked':''} /></td></tr>
				<tr><td> 修改帖子</td><td><input type="checkbox" name="modifyTopic" value="true" ${memberPms.modifyTopic?'checked':''}/></td></tr>
				<tr><td> 删除帖子</td><td><input type="checkbox" name="deleteTopic" value="true" ${memberPms.deleteTopic?'checked':''}/></td></tr>
				<tr><td> 回复帖子 </td><td><input type="checkbox" name="replyTopic" value="true" ${memberPms.replyTopic?'checked':''}/></td></tr>
				<tr><td colspan="2" align="center"><input type="button" id="savepm" onclick="postpm('formpm');" value=" 保 存 " /></td></tr>
				</table>
				</form>
				
				<br/>
			</td>
			
			<!-- 版主 -->
			<td valign="top">
				<form action="forumset.do?method=addmaster" method="post">
				<input type="hidden" name="forumID" value="${forum.id}">
				<table cellspacing="1" class="tbpemission" width="300">
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
		
		<tr><td colspan="2" align="center"><br/><a href="forumgroup.do?method=listAll"><img src="images/return.gif" border="0"></a></td></tr>
		</table>
	</div>
	
	<div class="copyright">版权所有</div>  
	</center>
 </body>
</html>
