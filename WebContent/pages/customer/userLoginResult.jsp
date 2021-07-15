<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<%@ page import="cn.estore.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>

<%
	CustomerDao dao = new CustomerDao();
	request.setCharacterEncoding("GBK");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	CustomerEntity userEntity = dao.selectCustomerEntity(name);
	
	String pas = userEntity.getPassword();
	
	 Encrypt des = new Encrypt("njcit");//自定义密钥 
	 
	
	 des.decrypt(des.encrypt(pas));
	/*  userEntity.setPassword(des.encrypt(userEntity.getPassword()));   */
 /* 	System.out.println("解密后的字符：" + des.decrypt(des.encrypt(test)));  */
	if(userEntity==null||userEntity.equals("")){
		
%>
	<script type="text/javascript">
		alert("不存在此用户，请重新登录！！！");
		history.go(-1);
	</script>
	
	<%
	}else{
		String pswDecrypt=des.encrypt(request.getParameter("password").trim());//将客户输入密码加密码和数据库中密码比较
	
		/* if(!userEntity.getPassword().equals(password)||password!=userEntity.getPassword())	{ */
		if (!pswDecrypt.equals(userEntity.getPassword())) { 	
	
	%>
	
	<script type="text/javascript">
		alert("密码错误，请重新登录！！！");
		history.go(-1);
	</script>
	
	<%
	}else{
		session.setAttribute("user", userEntity);
		session.setAttribute("name", name);
	%>

	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/pages/product/main.jsp";
	</script>


<%}} %>
</body>
</html>