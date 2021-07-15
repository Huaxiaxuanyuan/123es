<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.*" %>
<%@ page import="cn.estore.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" scope="session" class="cn.estore.entity.CustomerEntity">
</jsp:useBean>

<jsp:setProperty property="*" name="user"/>

<%
	request.setCharacterEncoding("GB2312");//JSP获取页面参数
	/* response.setContentType("text/html;charset=gb2312"); */
	 Encrypt des = new Encrypt("njcit");//自定义密钥   
	 user.setPassword(des.encrypt(user.getPassword())); 
 //     System.out.println("解密后的字符：" + des.decrypt(des.encrypt(test))); 	
	//用户管理
	CustomerDao dao = new CustomerDao();
	int action = Integer.parseInt(request.getParameter("action"));
	switch (action) {
	case 0: { // 添加用户信息
		CustomerEntity formSelect = dao.selectCustomerEntity(user.getUserName());
		if (formSelect == null || formSelect.equals("")) {
			if (dao.insertCustomer(user)){
			request.setAttribute("registerResult", "注册成功!!!");
			/* session.setAttribute("user", user);//注册成功后需提交当前用户的相关资料，servlet跳转要取这些数据
			session.setAttribute("name",user.getUserName()); */
			}else{
			request.setAttribute("registerResult", "该用户名已存在，注册不成功！请重新注册！");
			}
		} 
		%>
		
		<jsp:forward page="userRegisterResult.jsp"></jsp:forward>
		
 		<%
 		}
		case 2: {//修改用户信息
		if (dao.updateCustomer(user)){
			request.setAttribute("userUpdateResult", "用户信息修改成功222!!!");
		}else{
			request.setAttribute("userUpdateResult", "数据库操作失败，用户信息修改不成功！请重新操作111！");
		}
		%>
		
		<jsp:forward page="userUpdateResult.jsp"></jsp:forward>

 		<%
 		}
		}
		%>
</body>
</html>