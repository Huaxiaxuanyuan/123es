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

	<!-- 左侧登录 -->
	<table width="300" height="138" border="0" cellpadding="0" cellspacing="0"
	background="<%=request.getContextPath() %>/images/systemImages/fg_left01.jpg" style="background-repeat:no-repeat">
		
		<tr>
			<td valign="middle">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<!-- 设计一个空行，美化界面 -->
					<tr>
						<td height="10"></td>
					</tr>
				</table>
				
				<!-- 设计提交表单 -->
				<form name="form" method="post" action="<%=request.getContextPath() %>/pages/customer/userLoginResult.jsp" onSubmit="return checkEmpty(form)">
					<table width="100%" border="0" align="center">
						 <!-- 空行 -->
						 <tr height="10">
						 	<td></td>
						 </tr>
						 
						 <tr>
						 	<td width="60" height="25">账号:</td>
						 	<td width="115" height="25" >
						 		<input name="name" type="text" size="17">
						 	</td>
						 </tr>
	
						 <tr>
						 	<td height="35">密码:</td>
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
						 		<a href="<%=request.getContextPath() %>/pages/customer/userRegisterAjax/userRegister.jsp">注册</a>
						 		<a href="<%=request.getContextPath() %>/pages/customer/userPasswordFind1.jsp">找回密码</a>
						 	</td>
						 </tr>
					</table>
				</form>
			</td>
		</tr>
		
	</table>


</body>
</html>