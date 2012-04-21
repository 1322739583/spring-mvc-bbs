<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title>修改帖子</title>
    <%@ include file="/common.jsp"%>
    <script type="text/javascript" src="script/xheditor/xheditor-1.1.13-zh-cn.min.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript">
		$(document).ready(function(){
			$('#content').xheditor({
				upImgUrl:"upload.do?method=editorUpload",upImgExt:"jpg,jpeg,gif,png",
				tools:'Cut,Copy,Paste,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,Align,List,Outdent,Indent,Link,Unlink,Img,Flash,Media,Hr,Emot,Table,Source,Fullscreen',
				skin:'o2007blue',
				html5Upload:false});
		});

		function checkpost(){
			if(document.topic.title.value==""){
				alert("标题不能为空");
				document.topic.title.focus();
				return;
			}else if(document.topic.title.value.length>100){
				alert("标题最大长度为 100 个字");
				document.topic.title.focus();
				return;
			}
			
			if($('#content').val().length<3){
				alert("文章內容过少，请认真回复。");
				document.newtopic.content.focus();
				return;
			}
			
			if($('#content').val().length>8000){
				alert("文章內容过多，请删减后再提交");
				document.newtopic.content.focus();
				return;
			}
			
			document.topic.submit();
		}
		
	</script>  
  </head>
  
  <body>
	<jsp:include page="banner.jsp"></jsp:include>
	<jsp:include page="showlogin.jsp"></jsp:include>
    <!-- 导航区 -->
    <div class="position">
    	<a href="forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;-&nbsp;
	     <a href="forumgroup.do?method=listForumGroups&forumgroupid=${forum.forumGroup.id}">【${forum.forumGroup.name}】</a>&nbsp;-&nbsp;
	  	<a href="topic.do?method=list&forumID=${forum.id}">【${forum.name}】</a>&nbsp;-&nbsp;
	  	修改帖子
	</div>
  
    <div style="margin-bottom:6px">
    <a href="javascript:history.back()"><img src="images/return.gif" border="0"></a>
    </div> 
    
	<form name="topic" action="topic.do?method=update" method="post">
	<input type="hidden" name="forumID" value="${forum.id}">
	<input type="hidden" name="topicID" value="${topic.topicID}">
	<input type="hidden" name="account" value="${topic.author.id}"/>  
	
	<table cellspacing="1" cellpadding="4" class="tb">
	
		    <tr>
		      <th>修改帖子</th>
		    </tr>
		    <tr>
		      <td bgcolor="#f2f8ff">
				<center>
				<table>
				  <tr><td>标题：<input type="text" id="title" name="title" size="90" maxlength="50" value="${topic.title}"/></td></tr>
				  <tr><td><textarea name="content" id="content" cols="90" rows="22">${topic.content}</textarea></td></tr>
				  <tr><td align="center"><img src="images/submit.gif"  style="cursor:pointer" border="0" onclick="javacript:checkpost()" alt="提交"></img></td>
				</table>
				</center>
		       </td>
		    </tr>
	</table>
	</form>
   
   <br>
   <%@include file="copyright.jsp"%>
  </body>
</html>
