<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<%
	CustomerDao dao = new CustomerDao();
	CustomerEntity user=dao.selectCustomerEntity(request.getParameter("name"));
	application.setAttribute("user",user);
%>
<head>
<script language="javascript">
	function checkEmpty(form){
	for(i=0;i<form.length;i++){
	 if(form.elements[i].value==""){
		alert("����Ϣ����Ϊ��");
		return false;
		  }
		}
	}
</script>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
	
	<table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
	    	<%-- <tr>
	    		<td colspan="2" height="100">
	 				<jsp:include   page="../common/menu.jsp" flush="true" />
	     		</td>
	    	</tr> --%>
	    	
			<tr>
				<%-- <td width="300" valign="top" bgcolor="#F5F5F5">
					<!--���01-->
					<jsp:include page="../common/left.jsp" flush="true" />
				</td> --%>
				
				<td width="724" align="center" valign="top" bgcolor="#FFFFFF">

					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
					  <tr>
					    <td bgcolor="#FFFFFF" align="center">
					<%-- <img src="<%=tempImagePath %>" width="752" height="45"> --%>
					    <%if(user==null||user.equals("")){%>
					 <p><strong>�����ڴ��û�����,���������룡����</strong></p>
					 <meta http-equiv="refresh" content="2;URL=userPasswordFind1.jsp">
					  <%}else{%>
					  <p><strong>�����</strong></p>
					  <form name="form" method="post" action="userPasswordFind3.jsp" onSubmit="return checkEmpty(form)">
					    <table width="298"  border="0" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#819BBC" bordercolorlight="#FFFFFF">
					      <tr>
					        <td width="105" height="35">
					          <div align="right">����:</div></td>
					        <td width="187"><div align="left">
					            <input type="hidden" name="name" value="<%=user.getUserName()%>">
					            <input type="hidden" name="question" value="<%=user.getPasswordQuestion()%>">
					            	<%=user.getPasswordQuestion()%>
					        </div></td>
					      </tr>
					       <tr>
					        <td width="105" height="35">
					          <div align="right">��:</div></td>
					        <td width="187">
					          <div align="left">
					            <input type="text" name="result">
					          </div></td>
					      </tr>
					    </table>
					    <br>
					      <input type="image" class="input1"  src="<%=request.getContextPath() %>/images/systemImages/save.jpg" width="51" height="20">&nbsp;&nbsp;
						      <a href="#" onClick="javascript:form.reset()"><img src="<%=request.getContextPath() %>/images/systemImages/clear.gif"></a>&nbsp;&nbsp;
						      <a href="#" onClick="javasrcipt:history.go(-1)"><img src="<%=request.getContextPath() %>/images/systemImages/back.gif"></a>
					  </form>
					<%}%>
					   </td>
					  </tr>
					</table>

				</td>

					<tr>
						<td colspan="2">
							<jsp:include page="../common/statusBarNavigation.jsp"
								flush="true" />
						</td>
					</tr>
		</table>
	
	
</body>
</html>