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
	
	<form name="userForm" action="../user.jsp?action=0" method="post"
						onsubmit="">
						<table width="500" border="0" cellspacing="0" cellpadding="0">					
							
							<tr>
								<td width="107" height="35">
									<div align="right">
										用户名称：
									</div>
								</td>
								<td >
									<div align="left"> 
										<input type="text" name="userName" id="userName" onblur="Checker.checkNode(this)" /> 
									</div>
								</td>
								<td align="left">
        							<div  id="userNameCheckDiv" class="warning">请输入用户名 </div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										用户密码：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="password" name="password" id="password" onblur="Checker.checkPassword()">        
        							</div>
        						</td>
        						<td align="left">
       								<div id="passwordCheckDiv" class="warning">请输入密码</div>								
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										密码确认：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="password" name="password2" id="password2" 
											onblur="Checker.checkPassword()" >
									</div>
								</td>
								<td align="left">		
       								<div id="password2CheckDiv" class="warning">请再次输入密码</div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										真实姓名：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="realName" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										用户手机：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="mobile" id="mobile" onblur="Checker.checkNode(this)" />
								</td>
								<td align="left">
										<div  id="mobileCheckDiv" class="warning">请输入用户名 </div>
									</div>
								</td>
							</tr>

							<tr>
								<td height="35">
									<div align="right">
										电邮地址：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="email" id="email" 
											onblur="Checker.checkNode(this)">
									</div>
								</td>
								<td align="left">		
        								<div id="emailCheckDiv" class="warning">请输入邮件地址</div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										密码提示：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="passwordQuestion" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35">
									<div align="right">
										密码答案：
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="passwordHintAnswer" />
									</div>
								</td>
							</tr>
							
							<tr>
							    <td height="35">
									<div align="right">
										数字验证：
									</div>							    
							    </td>
							    <td>
							        <input type="text" name="code" id="code" size="5" onblur="Checker.checkNode(this)">
							        <img src="code.jsp" width="50" height="20" border="0" alt="">
							    </td>
							    <td align="left">
							        <div id="codeCheckDiv" class="warning">请输入验证码</div>
							    </td>
							</tr>
							
						</table>
						<br>
						<input type="image" class="input1" src="<%=request.getContextPath() %>/images/systemImages/save.jpg" width="51"
							height="20">
						<a href="#" onClick="javascript:userForm.reset()"><img	src="<%=request.getContextPath() %>/images/systemImages/clear.gif"> </a> &nbsp;&nbsp;
						<a href="#" onClick="javasrcipt:history.go(-1)"><img src="<%=request.getContextPath() %>/images/systemImages/back.gif"> </a>
	
</body>
</html>