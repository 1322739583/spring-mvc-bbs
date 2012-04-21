<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title>英语学习论坛</title>
    <%@ include file="/common.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
    
  <body>    
    <jsp:include page="banner.jsp"></jsp:include>
    <jsp:include page="showlogin.jsp"></jsp:include>
   
    <c:if test="${forumgroupid gt -1}">
	    <div class="position">
	    <a href="forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;&nbsp;-&nbsp;&nbsp;论坛列表
	    </div>
    </c:if> 
       
    
    <c:forEach items="${forumGrps}" var="fg">
			 <table cellspacing="1" cellpadding="4" class="tb">
			 
			 <tr><th colspan="4">【${fg.name}】</th></tr>
			 <tr  class="trtitle"><td colspan="2">论坛</td><td>主题</td><td>最新发表</td></tr>
			 
			 <c:forEach items="${fg.forums}" var="f">
			 	<tr>
				<td width="5%"><IMG src="images/bard.jpeg"></td>
				 <td>
					 <a href="topic.do?method=list&forumID=${f.id}">${f.name}</a>
					 <div class="fgnote">
					 	<img src="images/fginfo.gif"></img>
					 	<span style="vertical-align:TOP">  ${f.description}</span>
					 </div>
					 <div class="fgmaster">版主: 
						 <c:forEach items="${f.masters}" var="mst">${mst.userID}&nbsp;&nbsp;</c:forEach>
					 </div>
				 </td>
				 
				 <td width="7%" align="center">${f.totalTopics}</td>
				 <td width="30%" class="fgtopic">
				 	<div class="tpcTitle">主题：<a href="topic.do?method=view&forumID=${f.id}&topicID=${f.topicID}" title="${f.topicTitle}">${f.topicTitle}</a></div>
				 	作者：${f.userID}<br>日期：<fmt:formatDate value="${f.topicDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				 </td>
				 </tr> 
			 </c:forEach>
			 
			 </table>
			 <br/>
    </c:forEach>
    

    
	<%@include file="copyright.jsp"%>
  </body>
</html>
