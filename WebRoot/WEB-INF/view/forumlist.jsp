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
    
    <title>英语学习论坛</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <script src="<%=basePath%>/js/jquery-1.4.4.min.js"></script>
	<link href="<%=basePath%>/css/bbs/style/style.css" rel="stylesheet" type="text/css" />
  </head>
    
  <body>    
    <div class="posti"><div class="homePic"></div>您现在的位置：
    <c:choose>
    	<c:when test="${fgid eq -1}">【论坛首页】</c:when>
    	<c:otherwise><B><a href="bbs/forumgroup.do?method=listForumGroups">【论坛首页】</a></B>&nbsp;&nbsp;-&nbsp;&nbsp;论坛列表</c:otherwise>
    </c:choose>
    </div><br/>
       
    <div id="postsmain">
    
    <c:forEach items="${forumGrps}" var="fg">
    <div class="txt">
			 <table cellSpacing="0" cellPadding="0" class="tb">
			 
			 <tr><th colspan="4" align="left" class="mailTitle">【${fg.name}】</th></tr>
			 <tr  class="subtrbg" align="center"><td colspan="2">论坛</td><td>主题</td><td>最新发表</td></tr>
			 
			 <c:forEach items="${fg.forums}" var="f">
			 	<tr class="tr3">
				<td width="5%"><IMG src="css/bbs/images/bard.jpeg"></td>
				 <td>
					 <a href="bbs/topic.do?method=list&forumID=${f.id}">${f.name}</a>
					 <div class="fgnote">
					 	<img src="css/bbs/images/fginfo.gif"></img>
					 	<span style="vertical-align:TOP">  ${f.description}</span>
					 </div>
					 <div class="fgmaster">版主: 
						 <c:forEach items="${f.masters}" var="mst">${mst.userID}&nbsp;&nbsp;</c:forEach>
					 </div>
				 </td>
				 
				 <td width="7%" align="center">${f.totalTopics}</td>
				 <td width="30%" class="fgtopic">
				 	<div class="tpcTitle">主题：<a href="bbs/topic.do?method=view&forumID=${f.id}&topicID=${f.topicID}" title="${f.topicTitle}">${f.topicTitle}</a></div>
				 	作者：${f.userID}<br>日期：<fmt:formatDate value="${f.topicDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				 </td>
				 </tr> 
			 </c:forEach>
			 
			 </table>
		 </div>
    
    </c:forEach>
    
	</div>
  </body>
</html>
