<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>

<Link rel="stylesheet" type="text/css" href="style/style.css" />
<DIV class="showlogin">
	<%
		String showLoginID = (String) session.getAttribute("userid");
		if (showLoginID == null) {
	%>

	&nbsp;&nbsp;ÄúÉĞÎ´µÇÂ¼ <a href="user.do?method=login">µÇÂ¼</a>&nbsp;| &nbsp;<A href="user.do?method=register">×¢²á</A>

	<%} else {%>

	&nbsp;»¶Ó­:&nbsp;<%=showLoginID%>&nbsp;&nbsp;<a href="user.do?method=info">[ÉèÖÃ]</a>&nbsp;&nbsp;<a href="user.do?method=logout">[ÍË³ö]</a>
	<%}%>
</DIV>