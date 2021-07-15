<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String mainPath=request.getContextPath()+"/pages/product/main.jsp";  
%>
<script language='javascript'>alert('请先登录!');window.location.href='../product/main.jsp';</script>
</body>
</html>