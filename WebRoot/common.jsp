<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ page isELIgnored="false"%> 
<%
String baseURL = request.getContextPath();

request.setAttribute("baseURL",baseURL);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+baseURL+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<link rel="shortcut icon" href="${baseURL}/images/favicon.ico" />
<link href="${baseURL }/style/style.css" rel="stylesheet" type="text/css"/>
<script src="${baseURL}/script/jquery-1.4.4.min.js"></script>