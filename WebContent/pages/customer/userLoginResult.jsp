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
	
	 Encrypt des = new Encrypt("njcit");//�Զ�����Կ 
	 
	
	 des.decrypt(des.encrypt(pas));
	/*  userEntity.setPassword(des.encrypt(userEntity.getPassword()));   */
 /* 	System.out.println("���ܺ���ַ���" + des.decrypt(des.encrypt(test)));  */
	if(userEntity==null||userEntity.equals("")){
		
%>
	<script type="text/javascript">
		alert("�����ڴ��û��������µ�¼������");
		history.go(-1);
	</script>
	
	<%
	}else{
		String pswDecrypt=des.encrypt(request.getParameter("password").trim());//���ͻ������������������ݿ�������Ƚ�
	
		/* if(!userEntity.getPassword().equals(password)||password!=userEntity.getPassword())	{ */
		if (!pswDecrypt.equals(userEntity.getPassword())) { 	
	
	%>
	
	<script type="text/javascript">
		alert("������������µ�¼������");
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