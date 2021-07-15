<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">

<script type="text/javascript">
	function checkEmpty(form){
		for(i=0;i<form.length;i++){
			if(form.elements[i].value==""){
				alert("表单信息不能为空");
				return false;
			}
		}
	}
</script>

</head>
<body>
	<table width="100%"   bgcolor="#9fff" border="2"
	 align="center" cellpadding="0" cellspacing="0">
	 
	 <tr>
		<td>
			<font color="orange">在线人数
				<%
					if(application.getAttribute("counter")!=null){
				%>
				<%=application.getAttribute("counter") %>
				<%}else{ %>1
				<%} %>
			</font>
		</td>
	</tr>
		<tr>
			<td width="30%"  valign="top">
				<br>
				<%@ include file="../common/leftParts/findProductsByName.jsp" %>
			</td>
			
		</tr>
		
		<tr>
			<td width="30%"  valign="top">
				<br>
				<%@ include file="../common/leftParts/login.jsp" %>
			</td>
		</tr>
		
	</table>
</body>
</html>