<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>

<body>

	<!-- ����¼ -->
	<table width="300" height="138" border="0" cellpadding="0" cellspacing="0"
	background="<%=request.getContextPath() %>/images/systemImages/fg_left01.jpg" style="background-repeat:no-repeat">
		
		<tr>
			<td valign="middle">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<!-- ���һ�����У��������� -->
					<tr>
						<td height="10"></td>
					</tr>
				</table>
				
				<!-- ����ύ�� -->
				<form name="form" method="post" action="<%=request.getContextPath() %>/pages/customer/userLoginResult.jsp" onSubmit="return checkEmpty(form)">
					<table width="100%" border="0" align="center">
						 <!-- ���� -->
						 <tr height="10">
						 	<td></td>
						 </tr>
						 
						 <tr>
						 	<td width="60" height="25">�˺�:</td>
						 	<td width="115" height="25" >
						 		<input name="name" type="text" size="17">
						 	</td>
						 </tr>
	
						 <tr>
						 	<td height="35">����:</td>
						 	<td width="115" height="25">
						 		<input name="password" type="text" size="17">
						 	</td>
						 </tr>
						 
						 <tr>
						 	<td height="25">
						 		<input type="image" class="input1" src="<%=request.getContextPath() %>/images/systemImages/fg-land.gif"
						 		width="51" height="20">
						 	</td>
						 	
						 	<td height="25">
						 		<a href="<%=request.getContextPath() %>/pages/customer/userRegisterAjax/userRegister.jsp">ע��</a>
						 		<a href="<%=request.getContextPath() %>/pages/customer/userPasswordFind1.jsp">�һ�����</a>
						 	</td>
						 </tr>
					</table>
				</form>
			</td>
		</tr>
		
	</table>


</body>
</html>