<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>

<Link rel="stylesheet" type="text/css" href="style/style.css" />
<DIV class="showlogin">
	<%
		String showLoginID = (String) session.getAttribute("userid");
		if (showLoginID == null) {
	%>

	&nbsp;&nbsp;����δ��¼ <a href="user.do?method=login">��¼</a>&nbsp;| &nbsp;<A href="user.do?method=register">ע��</A>

	<%} else {%>

	&nbsp;��ӭ:&nbsp;<%=showLoginID%>&nbsp;&nbsp;<a href="user.do?method=info">[����]</a>&nbsp;&nbsp;<a href="user.do?method=logout">[�˳�]</a>
	<%}%>
</DIV>