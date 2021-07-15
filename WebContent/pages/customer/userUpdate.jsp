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
<%
	CustomerDao dao = new CustomerDao();
	CustomerEntity user = (CustomerEntity)dao.selectCustomerEntity((String)request.getParameter("name"));
%>

</head>
<body>
	<form name="userForm" action="user.jsp?action=2" method="POST"
						onsubmit="return checkEmpty(userForm)">
						<input type="hidden" name="id" value="<%=user.getId()%>" />
						<table width="298" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105" height="35">
									<div align="right">
										用户名称：
									</div>
								</td>
								<td width="187">
									<div align="center">
										<input type="hidden" name="user_name"
											value="<%=user.getUserName()%>"><%=user.getUserName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">
										<input type="hidden" name="password_hint_answer"
											value="<%=user.getPasswordHintAnswer()%>">
										<input type="hidden" name="password_question"
											value="<%=user.getPasswordQuestion()%>">
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										用户密码：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="password" name="password">
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										密码确认：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="password" name="password_1">
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										真实姓名：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="real_name"
											value="<%=user.getRealName()%>">
									</div>
								</td>
							</tr>

							<tr>
								<td height="35">
									<div align="right">
										手机号码：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="mobile" value="<%=user.getMobile()%>">
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										邮件地址：
									</div>
								</td>
								<td>
									<div align="center">
										<input name="email" type="text" value="<%=user.getEmail()%>">
									</div>
								</td>
							</tr>
						</table>
						<br>
						
						<%-- <input type="hidden" name="id" value="<%=user.getId()%>"/>
						<input type="hidden" name="name" value="<%=user.getUserName()%>"/>
						<input type="hidden" name="result" value="<%=user.getEmail()%>"/> --%>
						
						
						 <input type="image" class="input1"  src="<%=request.getContextPath() %>/images/systemImages/save.jpg" width="51" height="20">&nbsp;&nbsp;
						      <a href="#" onClick="javascript:userForm.reset()"><img src="<%=request.getContextPath() %>/images/systemImages/clear.gif"></a>&nbsp;&nbsp;
						      <a href="#" onClick="javasrcipt:history.go(-1)"><img src="<%=request.getContextPath() %>/images/systemImages/back.gif"></a>
					</form>
</body>
</html>