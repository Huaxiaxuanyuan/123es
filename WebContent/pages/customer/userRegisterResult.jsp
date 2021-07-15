<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
	
<%-- <jsp:include page="<%=request.getContextPath() %>/pages/common/head.jsp" flush="false" /> --%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="724" valign="top" bgcolor="#FFFFFF" align="center">
   <p>&nbsp;</p>

  <p><strong><%=request.getAttribute("registerResult")%></strong></p>
	<meta http-equiv="refresh" content="2;URL=../product/main.jsp">
      <p>&nbsp;</p>
 	</td>
  </tr>
</table>

<%-- <jsp:include page="<%=request.getContextPath() %>/pages/common/statusBarNavigation.jsp" flush="true" /> --%>
</body>
</html>