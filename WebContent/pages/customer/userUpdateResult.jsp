<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
	<body>
		<%-- <jsp:include page="<%=request.getContextPath()%>/pages/common/head.jsp" flush="false" /> --%>

		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="724" valign="top" bgcolor="#FFFFFF" align="center">
					<p>
						&nbsp;
					</p>

					<p>
						<strong><%=request.getAttribute("userUpdateResult")%></strong>
					</p>
					<meta http-equiv="refresh"
						content="2;URL=<%=request.getContextPath()%>/pages/product/main.jsp">
					<p>
						&nbsp;
					</p>
				</td>
			</tr>
		</table>

		<%-- <jsp:include page="<%=request.getContextPath()%>/pages/common/statusBarNavigation.jsp" flush="true" /> --%>
</body>
</html>