<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.CustomerEntity" %>
<%@ page import="cn.estore.dao.CustomerDao" %>
<%
CustomerDao dao = new CustomerDao();
request.setCharacterEncoding("gb2312");
String result=request.getParameter("result").trim();
//CustomerEntity user=(CustomerEntity)session.getAttribute("user");	
CustomerEntity user=(CustomerEntity)application.getAttribute("user");	
String name=request.getParameter("name").trim();
//CustomerEntity user=dao.selectFind(name,result); ��ǰ����user�������������Լ���һ�����ݲ�ѯ
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<script language="javascript">
	function checkEmpty(form){
	for(i=0;i<form.length;i++){
	 if(form.elements[i].value==""){
		alert("����Ϣ����Ϊ��");
		return false;
		  }
		}
     }		
	if(document.form.password.value!=document.form.passwordOne.value){
		window.alert("��������������벻һ�£�����������");
			return false;
			}
	}		

</script>
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
					 <%
					   	if(user==null||user.equals(""))
					   	/* if(!result.equals(user.getPasswordHintAnswer()))*/
					   		{ 
					  %>
					 <p><strong>�𰸲���ȷ,���������룡����</strong></p>
					 <%-- <meta http-equiv="refresh" content="2;URL=userPasswordFind2.jsp?name=<%=name%>"> --%>
					  <%}else{%>
					  <p><strong>����������</strong></p>
					  <form name="form" method="post" action="userPasswordFind4.jsp?id=<%=user.getId()%>" onSubmit="return checkEmpty(form)">
					    <table width="298"  border="0" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF" bordercolordark="#819BBC" bordercolorlight="#FFFFFF">
					      <tr>
					        <td width="105" height="35">
					          <div align="right">�������µ����룺</div></td>
					        <td width="187"><div align="center">
					          <input type="password" name="password">
					        </div></td>
					      </tr>
					       <tr>
					        <td width="105" height="35">
					          <div align="right">ȷ�����룺</div></td>
					        <td width="187"><div align="center">
					                 <input type="password" name="passwordOne">
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
						<%-- <td colspan="2">
							<jsp:include page="../common/statusBarNavigation.jsp"
								flush="true" />
						</td> --%>
					</tr>
		</table>
	
</body>
</html>