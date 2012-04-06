<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增帖子</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="<%=basePath%>/css/bbs/style/style.css" rel="stylesheet" type="text/css" />
  </head>
  
<!-- TinyMCE -->
<script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		skin : "o2k7",
		plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",
		language : "zh-cn", 
		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,blockquote,|,insertdate,inserttime,|,forecolor,backcolor,|,charmap,|,print,|,ltr,rtl",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top", 
		theme_advanced_toolbar_align : "left",
		theme_advanced_resizing : true,
		theme_advanced_statusbar_location : "bottom"
		//theme_advanced_fonts:"宋体=宋体;隶书=隶书;华文行楷=华文行楷;黑体=黑体",
	});
</script>   
  
  
  
<script>  
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
	
	if(tinyMCE.get('content').getContent().length<9){
		alert("文章內容少于 2 个字");
		document.newtopic.content.focus();
		return;
	}
	
	if(tinyMCE.get('content').getContent().length>8000){
		alert("文章內容过多，请删减后再提交");
		document.newtopic.content.focus();
		return;
	}
	
	document.topic.submit();
}


</script>
  
  <body>

    <!-- 导航区 -->
    <div class="posti"><div class="homePic"></div>您现在的位置：
    <B><a href="bbs/forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;-&nbsp;
	     <a href="bbs/forumgroup.do?method=listForumGroups&fgid=${forum.forumGroup.id}">【${forum.forumGroup.name}】</a>&nbsp;-&nbsp;
	  	<a href="bbs/topic.do?method=list&forumID=${forum.id}">【${forum.name}】</a>&nbsp;-&nbsp;
	  </B>新增帖子
	</div>
  
    <div id="postsmain">
    <div style="margin-bottom:6px">
    <a href="javascript:history.back()"><img src="css/bbs/images/return.gif" border="0"></a>
    </div> 
    
	<form name="topic" action="bbs/topic.do?method=add" method="post" class="txt">
	<input type="hidden" name="forumID" value="${forum.id}">
	<table cellspacing="0" cellpadding="0" width="100%">
	    <tr>
	      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><b>新增帖子</b></td>
	    </tr>
	    <tr>
	      <td bgcolor="#f2f8ff">
			<center>
			<table>
			  <tr><td><span class="fsize"> 标题：</span><input type="text" id="title" name="title" size="70" maxlength="50"/></td></tr>
			  <tr><td><textarea name="content" id="content" cols="90" rows="22"></textarea></td></tr>
			  <tr><td align="center"><img src="css/bbs/images/submit.gif"  style="cursor:pointer" border="0" onclick="javacript:checkpost()" alt="提交"></img></td>
			</table>
			</center>
	       </td>
	    </tr>
	</table>
	</form>
   
	</div>
   <br>
  </body>
</html>
