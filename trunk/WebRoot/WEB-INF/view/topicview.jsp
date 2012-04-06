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
    
    <title> ${topic.title} </title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
	<script src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	<link href="<%=basePath%>css/bbs/style/style.css" rel="stylesheet" type="text/css" />
  </head>
  
<!-- TinyMCE -->
<script type="text/javascript" src="<%=basePath%>js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
// O2k7 skin (silver)
	tinyMCE.init({
		// General options
		mode : "exact",
		elements : "content",
		theme : "advanced",
		skin : "o2k7",
		language : "zh-cn", 
		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left"
		//theme_advanced_fonts:"宋体=宋体;隶书=隶书;华文行楷=华文行楷;黑体=黑体",
	});
</script>    
  
  
<script type="text/javascript">
   $(document).ready(function(){
	 parent.document.all("rightfra").style.height=document.body.scrollHeight;
	});

 function replyinfo(txt){
	if(typeof document.reply!= "undefined"){
		document.reply.title.value = 'Re:'+txt+'楼';
		document.reply.title.focus();
		tinyMCE.get('content').focus();
		document.reply.title.scrollIntoView();
	}
}

function checkpost(){
	if(document.reply.title.value==""){
		alert("标题不能为空");
		document.reply.title.focus();
		return;
	}else if(document.reply.title.value.length>100){
		alert("标题最大长度为 100 个字");
		document.reply.title.focus();
		return;
	}
	
	if(tinyMCE.get('content').getContent().length<9){
		alert("回复內容少于 2 个字");
		document.reply.content.focus();
		return;
	}
	
	if(tinyMCE.get('content').getContent().length>8000){
		alert("文章內容过多，请删减后再提交");
		document.newtopic.content.focus();
		return;
	}
	
	document.reply.submit();
}

function delconfirm(){
  if(confirm("记录删除后将无法恢复，确定要删除？")) {
	return true;
	}
	return false;
}

function keyPress() {  
    var keyCode = event.keyCode;  
    if ((keyCode >= 48 && keyCode <= 57))  
    {  
        event.returnValue = true;  
    } else {  
        event.returnValue = false;  
    }  
} 

function goToPage(page){
	location='<%=basePath%>bbs/topic.do?method=view&forumID=${forum.id}&topicID=${topic.topicID}&page='+page;
}
</script>
  
  <body>     
    <!-- 导航区 -->
    <div class="posti"><div class="homePic"></div>您现在的位置：
    <B><a href="bbs/forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;-&nbsp;
	     <a href="bbs/forumgroup.do?method=listForumGroups&fgid=${forum.forumGroup.id}">【${forum.forumGroup.name}】</a>&nbsp;-&nbsp;
	  	<a href="bbs/topic.do?method=list&forumID=${forum.id}">【${forum.name}】</a>&nbsp;-&nbsp;
	  </B>帖子明细
    </div>
    
   <div id="postsmain">     
    <div>
    <span style="float:right;clear:both">回复:${topic.totalReply}</span>
    <a href="bbs/topic.do?method=add&forumID=${forum.id}"><img src="css/bbs/images/postnew.jpg" border="0">&nbsp;</a>
    <a href="bbs/reply.do?method=add&forumID=${forum.id}&topicID=${topic.topicID}"><img src="css/bbs/images/reply.gif" border="0"></a>
    </div> 
     
  <!-- 帖子详细内容 -->
  <div class="txt">
  <div class="mailTitle">&nbsp;※&nbsp;&nbsp;<B>主题：</B>${topic.title}</div>
  
  <!-- 第一页才显示帖子内容 -->
  <c:if test="${page<2}">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
      <tbody>
        <tr class="tr3">
          <td width="20%" rowspan="2"  valign="top"> <font color="#000066"><b>${topic.author.account}</b></font><br>
		  <c:choose>
          	<c:when test="${(topic.author.userPic eq null) or (fn:trim(topic.author.userPic) eq '')}"><img src="css/bbs/images/face/unknow.jpeg" alt="图片${topic.author.userPic}"/></c:when>
          	<c:otherwise><img src="${topic.author.userPic}" width="90" height="90" alt="图片"/></c:otherwise>
          </c:choose>
            <br>
                <span class="fsize">
            	 电子邮箱: <font color="#984b98">${topic.author.email}</font><br>
           		 注册时间:<font color="#555555"><fmt:formatDate value="${topic.author.createTime}" pattern="yyyy-MM-dd"/></font><br>
           		 </span>
          </td>
           <td height="100%" valign="top" style="padding: 5px 15px 0 15px; border: 0;"> 
                <div class="lbtm"><span class="fsize" style="float:right"><a href="bbs/reply.do?method=add&forumID=${forum.id}&topicID=${topic.topicID}">回复</a> 
                <a href="bbs/topic.do?method=update&forumID=${forum.id}&topicID=${topic.topicID}&account=${topic.author.account}">编辑</a> 
                <a href="bbs/topic.do?method=delete&forumID=${forum.id}&topicID=${topic.topicID}&account=${topic.author.account}" onclick="return delconfirm()">删除</a>
                </span><span class="fsize1b">${topic.title}</span></div>
                <div class="fsize">${topic.content}<br></div>
          </td> 
        </tr>
        
        <tr class="tr3" valign="bottom">
          <td >
          <div style="float:right" class="fsize gray">
          <c:if test="${topic.lastUpdate ne null}">最后修改：<fmt:formatDate value="${topic.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
          </div>&nbsp;
          <div class="tipad fsize"><span style="float: right"> <a href="javascript:scroll(0,0)">TOP</a> </span> Posted:<fmt:formatDate value="${topic.postTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;|&nbsp;&nbsp; 楼主 </div>
          </td>
        </tr>
      </tbody>
    </table>
  </c:if>
  </div>  
 
 <!-- 回复列表 -->    
 	<c:forEach items="${rpList.data}" var="rp">
    <div class="txt">
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
      <tbody>
        <tr class="tr3">
          <td width="20%" rowspan="2"  valign="top"> <font color="#000066"><b>${rp.author.account}</b></font><br>
          <c:choose>
          	<c:when test="${(rp.author.userPic eq null) or (fn:trim(rp.author.userPic) eq '')}"><img src="css/bbs/images/face/unknow.jpeg" alt="图片"/></c:when>
          	<c:otherwise><img src="${rp.author.userPic}" width="90" height="90" alt="图片"/></c:otherwise>
          </c:choose>
          
            <br>
                <span class="fsize">
                                      电子邮箱: <font color="#984b98">${rp.author.email}</font><br>
           		 注册时间:<font color="#555555"><fmt:formatDate value="${rp.author.createTime}" pattern="yyyy-MM-dd"/></font><br/>
           		</span>
          </td>
           <td height="100%" valign="top" style="padding: 5px 15px 0 15px; border: 0;"> 

                <div class="lbtm"><span class="fsize" style="float:right"><a href="javascript:replyinfo(' ${rp.building}')">回复</a> 
	                <a href="bbs/reply.do?method=update&forumID=${forum.id}&topicID=${topic.topicID}&account=${rp.author.account}&ID=${rp.ID}">编辑</a> 
	                <a href="bbs/reply.do?method=delete&forumID=${forum.id}&topicID=${topic.topicID}&account=${rp.author.account}&ID=${rp.ID}" onclick="return delconfirm()">删除</a></span>
	                <span class="fsize1">&nbsp;${rp.title}</span>
                </div>
                <div class="fsize">${rp.content}</div>
          </td> 
        </tr>
        
        <tr class="tr3" valign="bottom"> 
          <td >
          <div style="float:right" class="fsize gray">
          <c:if test="${rp.lastUpdate ne null}">最后修改：<fmt:formatDate value="${rp.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
          </div>&nbsp;
          <div class="tipad fsize"><span style="float: right"> <a href="javascript:scroll(0,0)">TOP</a> </span> Posted:<fmt:formatDate value="${rp.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;|&nbsp;&nbsp;${rp.building}楼</div>
          </td>
        </tr>
      </tbody>
    </table>
    </div>   
   </c:forEach>  
    
     
 	<!-- 分页区 共显示9页，当前页前后四页 -->  
	 <div class="t3">
		 <table width="100%" align="center" cellspacing="0" cellpadding="0">
			<tr>
			<td align="left" valign="middle"><div class="pages">
			<c:choose>
				<c:when test="${page>1}"><a href="javascript:void(0);" onclick="goToPage(${page-1})">【上一页】</a></c:when>
				<c:otherwise><a href="javascript:alert('已经是第一页.')">【上一页】</a></c:otherwise>
			</c:choose>

			<a href="javascript:void(0);" onclick="goToPage(1)"  title ="首页" style="font-weight:bold">&laquo;</a>
			
			<c:forEach items="${rpList.pageList}" var="num">
				<c:choose>
					<c:when test="${num eq page}">${num}</c:when>
					<c:otherwise><a href="javascript:void(0);" onclick="goToPage(${num})">${num}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			  	
			<input type="text" size="3" onkeypress="keyPress()" onkeydown="javascript: if(event.keyCode==13){goToPage(this.value);}"> 	
			
			<a href="javascript:void(0);" onclick="goToPage(${rpList.totalPageCount})" title="尾页" style="font-weight:bold">&raquo;</a> 
			
			<c:choose>
				<c:when test="${page<rpList.totalPageCount}"><a href="javascript:void(0);" onclick="goToPage(${page+1})">【下一页】</a></c:when>
				<c:otherwise><a href="javascript:alert('已经是最后一页.')">【下一页】</a></c:otherwise>
			</c:choose>
			
			Pages: ( ${page}&nbsp;of&nbsp;${rpList.totalPageCount} )
			</div>
			</td>
			
			<td>
		    </td>
			</tr>
		</table>
	</div>

	<!-- 快速回复区 -->
	<br>
	<form name="reply" action="bbs/reply.do?method=add" method="post" class="txt">
    <input type="hidden" name="topicID" value="${topic.topicID}"> 
    <input type="hidden" name="forumID" value="${forum.id}"> 
	
		<table cellspacing="0" cellpadding="0" width="100%">
		    <tr>
		      <td class="txtsty fsize1" style="BORDER-BOTTOM:#a6cbe7 1px solid"><span class="fsize" style="float: right"><a href="javascript:scroll(0,0)">TOP</a></span><b>快速回帖</b></td>
		    </tr>
		    <tr>
		      <td bgcolor="#f2f8ff">
				<center>
				<table>
				  <tr><td><span class="fsize"> 标题：</span><input type="text" id="title" name="title" size="70" maxlength="50" value="Re:${topic.title}"/></td></tr>
				  <tr><td><textarea name="content" id="content" cols="90" rows="10"></textarea></td></tr>
				  <tr><td>&nbsp;<img src="css/bbs/images/reply.gif" style="cursor:pointer" border="0" onclick="javacript:checkpost();" alt="提交"></img></td>
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
