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
										�û����ƣ�
									</div>
								</td>
								<td >
									<div align="left"> 
										<input type="text" name="userName" id="userName" onblur="Checker.checkNode(this)" /> 
									</div>
								</td>
								<td align="left">
        							<div  id="userNameCheckDiv" class="warning">�������û��� </div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										�û����룺
									</div>
								</td>
								<td>
									<div align="left">
										<input type="password" name="password" id="password" onblur="Checker.checkPassword()">        
        							</div>
        						</td>
        						<td align="left">
       								<div id="passwordCheckDiv" class="warning">����������</div>								
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										����ȷ�ϣ�
									</div>
								</td>
								<td>
									<div align="left">
										<input type="password" name="password2" id="password2" 
											onblur="Checker.checkPassword()" >
									</div>
								</td>
								<td align="left">		
       								<div id="password2CheckDiv" class="warning">���ٴ���������</div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										��ʵ������
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
										�û��ֻ���
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="mobile" id="mobile" onblur="Checker.checkNode(this)" />
								</td>
								<td align="left">
										<div  id="mobileCheckDiv" class="warning">�������û��� </div>
									</div>
								</td>
							</tr>

							<tr>
								<td height="35">
									<div align="right">
										���ʵ�ַ��
									</div>
								</td>
								<td>
									<div align="left">
										<input type="text" name="email" id="email" 
											onblur="Checker.checkNode(this)">
									</div>
								</td>
								<td align="left">		
        								<div id="emailCheckDiv" class="warning">�������ʼ���ַ</div>
								</td>
							</tr>
							
							<tr>
								<td height="35">
									<div align="right">
										������ʾ��
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
										����𰸣�
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
										������֤��
									</div>							    
							    </td>
							    <td>
							        <input type="text" name="code" id="code" size="5" onblur="Checker.checkNode(this)">
							        <img src="code.jsp" width="50" height="20" border="0" alt="">
							    </td>
							    <td align="left">
							        <div id="codeCheckDiv" class="warning">��������֤��</div>
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