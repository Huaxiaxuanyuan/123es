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
	request.setCharacterEncoding("GB2312");//JSP��ȡҳ�����
	/* response.setContentType("text/html;charset=gb2312"); */
	 Encrypt des = new Encrypt("njcit");//�Զ�����Կ   
	 user.setPassword(des.encrypt(user.getPassword())); 
 //     System.out.println("���ܺ���ַ���" + des.decrypt(des.encrypt(test))); 	
	//�û�����
	CustomerDao dao = new CustomerDao();
	int action = Integer.parseInt(request.getParameter("action"));
	switch (action) {
	case 0: { // ����û���Ϣ
		CustomerEntity formSelect = dao.selectCustomerEntity(user.getUserName());
		if (formSelect == null || formSelect.equals("")) {
			if (dao.insertCustomer(user)){
			request.setAttribute("registerResult", "ע��ɹ�!!!");
			/* session.setAttribute("user", user);//ע��ɹ������ύ��ǰ�û���������ϣ�servlet��תҪȡ��Щ����
			session.setAttribute("name",user.getUserName()); */
			}else{
			request.setAttribute("registerResult", "���û����Ѵ��ڣ�ע�᲻�ɹ���������ע�ᣡ");
			}
		} 
		%>
		
		<jsp:forward page="userRegisterResult.jsp"></jsp:forward>
		
 		<%
 		}
		case 2: {//�޸��û���Ϣ
		if (dao.updateCustomer(user)){
			request.setAttribute("userUpdateResult", "�û���Ϣ�޸ĳɹ�222!!!");
		}else{
			request.setAttribute("userUpdateResult", "���ݿ����ʧ�ܣ��û���Ϣ�޸Ĳ��ɹ��������²���111��");
		}
		%>
		
		<jsp:forward page="userUpdateResult.jsp"></jsp:forward>

 		<%
 		}
		}
		%>
</body>
</html>