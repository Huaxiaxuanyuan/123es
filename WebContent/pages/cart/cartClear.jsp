<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("_CART_");
	response.sendRedirect("../product/main.jsp");
%>
	
</body>
</html>