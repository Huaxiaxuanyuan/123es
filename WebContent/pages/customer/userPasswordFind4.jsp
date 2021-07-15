<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
<%
	CustomerDao dao = new CustomerDao();
	String password=request.getParameter("password").trim();
	Integer id=Integer.valueOf(request.getParameter("id"));
	boolean change=dao.updatePassword(password,id);	
%>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
	    	<tr>
	    		<%-- <td colspan="2" height="100">
	 				<jsp:include   page="../common/menu.jsp" flush="true" />
	     		</td> --%>
	    	</tr>
	    	
			<tr>
				<td width="300" valign="top" bgcolor="#F5F5F5">
					<!--左侧01-->
					<jsp:include page="../common/left.jsp" flush="true" />
				</td>
				
				<td width="724" align="center" valign="top" bgcolor="#FFFFFF">

					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
					  <tr>
					    <td bgcolor="#FFFFFF" align="center">
					<%-- <img src="<%=tempImagePath%>" width="752" height="45"> --%>
					   <p><strong>
					    <%if(change){%>		    密码修改成功！！！
					  <%}else{%>     		    密码修改失败！！！
					  <%}%>
					  </strong></p>
					<meta http-equiv="refresh" content="2;URL=../product/SuccessLogin.jsp">
					   </td>
					  </tr>
					</table>

				</td>

					<tr>
						<%-- <td colspan="2"><jsp:include page="../common/statusBarNavigation.jsp"
								flush="true" />
						</td> --%>
					</tr>
		</table>
</body>
</html>