<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title> ${topic.title} </title>
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

		function replyinfo(txt){
			if(typeof document.reply!= "undefined"){
				document.reply.title.value = 'Re:'+txt+'楼';
				document.reply.title.focus();
				$('#content').focus();
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
			
			if($('#content').val().length<2){
				alert("回复內容过少，请认真回复");
				document.reply.content.focus();
				return;
			}
			
			if($('#content').val().length>8000){
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
			location='<%=basePath%>topic.do?method=view&forumID=${forum.id}&topicID=${topic.topicID}&page='+page;
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
	  	帖子明细
    </div>
    
    <div>
    <span class="floatright">回复:${topic.totalReply}</span>
    <a href="topic.do?method=add&forumID=${forum.id}"><img src="images/postnew.jpg" border="0">&nbsp;</a>
    <a href="reply.do?method=add&forumID=${forum.id}&topicID=${topic.topicID}"><img src="images/reply.gif" border="0"></a>
    </div> 
     
  <!-- 帖子详细内容 -->
    <table cellspacing="1" cellpadding="4" class="tb">
    	<tr><th colspan="2">主题：${topic.title}	</th></tr>
    	
    	<!-- 第一页才显示帖子内容 -->
    	<c:if test="${page<2}">
        <tr>
          <td width="20%" rowspan="3"  valign="top"> <font color="#000066"><b>${topic.author.id}</b></font><br>
		  <c:choose>
          	<c:when test="${(topic.author.face eq null) or (fn:trim(topic.author.face) eq '')}"><img src="images/face/unknow.jpeg" alt="图片"/></c:when>
          	<c:otherwise><img src="images/face/${topic.author.face}" width="90" height="90" alt="图片"/></c:otherwise>
          </c:choose>
            <br>
            	总帖子数: <font color="#984b98">${topic.author.totalTopics}</font><br>
            	总回复数: <font color="#984b98">${topic.author.totalReplys}</font><br>
           		 注册时间:<font color="#555555"><fmt:formatDate value="${topic.author.regDate}" pattern=" yyyy-MM-dd"/></font><br>
          </td>
           <td valign="top" style="background:#EEF5FD;height:16px;"> 
                <div class="txtbtn">
	                <span class="floatright">
		                <a href="reply.do?method=add&forumID=${forum.id}&topicID=${topic.topicID}">回复</a> 
		                <a href="topic.do?method=update&forumID=${forum.id}&topicID=${topic.topicID}&account=${topic.author.id}">编辑</a> 
		                <a href="topic.do?method=delete&forumID=${forum.id}&topicID=${topic.topicID}&account=${topic.author.id}" onclick="return delconfirm()">删除</a>
	                </span>
	                <span>&nbsp;${topic.title}</span>
                </div>
          </td> 
        </tr>
        
        <tr>
        	<td height="105">${topic.content}<br>
        		<div class="gray">
	          	<c:if test="${topic.lastUpdate ne null}"> ----------------------------<br/>最后修改：<fmt:formatDate value="${topic.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
	          	</div>
        	</td>
        </tr>
        
        <tr valign="bottom">
          <td>
          <span class="floatright"> <a href="javascript:scroll(0,0)">TOP</a> </span> Posted:<fmt:formatDate value="${topic.postTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;|&nbsp;&nbsp; 楼主
          </td>
        </tr>
        </c:if>
    </table>
  	<br />
 
 <!-- 回复列表 -->    
 	<c:forEach items="${rpList.data}" var="rp">
    <table cellspacing="1" cellpadding="4" class="tb">
        <tr>
          <td width="20%" rowspan="3"  valign="top"> <font color="#000066"><b>${rp.author.id}</b></font><br>
          <c:choose>
          	<c:when test="${(rp.author.face eq null) or (fn:trim(rp.author.face) eq '')}"><img src="images/face/unknow.jpeg" alt="图片"/></c:when>
          	<c:otherwise><img src="images/face/${rp.author.face}" width="90" height="90" alt="图片"/></c:otherwise>
          </c:choose>
            <br>
            	总帖子数: <font color="#984b98"> ${rp.author.totalTopics}</font><br>
            	总回复数: <font color="#984b98"> ${rp.author.totalReplys}</font><br>
           		 注册时间: <font color="#555555"><fmt:formatDate value="${rp.author.regDate}" pattern=" yyyy-MM-dd"/></font><br>
          </td>
           <td style="background:#EEF5FD;height:16px;"> 
                <div class="txtbtn">
                	<span class="floatright">
	                	<a href="javascript:replyinfo(' ${rp.building}')">回复</a> 
		                <a href="reply.do?method=update&forumID=${forum.id}&topicID=${topic.topicID}&account=${rp.author.id}&ID=${rp.ID}">编辑</a> 
		                <a href="reply.do?method=delete&forumID=${forum.id}&topicID=${topic.topicID}&account=${rp.author.id}&ID=${rp.ID}" onclick="return delconfirm()">删除</a>
	                </span>
	                <span>&nbsp;${rp.title}</span>
                </div>
          </td> 
        </tr>
        <tr>
        	<td height="110">${rp.content}<br>
        		<div class="gray">
	          	<c:if test="${rp.lastUpdate ne null}"> ----------------------------<br/>最后修改：<fmt:formatDate value="${rp.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
	          	</div>
        	</td>
        </tr>
        
        <tr> 
          <td >
          <div class="tipad"><span style="float: right"> <a href="javascript:scroll(0,0)">TOP</a> </span> Posted:<fmt:formatDate value="${rp.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;|&nbsp;&nbsp;${rp.building}楼</div>
          </td>
        </tr>
    </table>
    <br/>
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
	<form name="reply" action="reply.do?method=add" method="post" class="txt">
    <input type="hidden" name="topicID" value="${topic.topicID}"> 
    <input type="hidden" name="forumID" value="${forum.id}"> 
	
		<table cellspacing="1" cellpadding="4" class="tb">
		    <tr>
		      <th><span class="floatright"><a href="javascript:scroll(0,0)">TOP</a></span>快速回帖</th>
		    </tr>
		    <tr>
		      <td bgcolor="#f2f8ff">
				<center>
				<table>
				  <tr><td>标题：<input type="text" id="title" name="title" size="90" maxlength="50" value="Re:${topic.title}"/></td></tr>
				  <tr><td><textarea name="content" id="content" cols="90" rows="10"></textarea></td></tr>
				  <tr><td>&nbsp;<img src="images/reply.gif" style="cursor:pointer" border="0" onclick="javacript:checkpost();" alt="提交"></img></td>
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

