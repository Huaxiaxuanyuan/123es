<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.ProductEntity" %>
<%@ page import="cn.estore.dao.ProductDao" %>
<%@ page import="java.util.*"  %>
<html>
<head>
<meta charset="GBK">
<title>estore</title>

<style type="text/css">
	  #container2 {
            width: 100%;
            height: 590px;
        }
        #container3 {
            width: 100%;
            height: 590px;
        }
</style>

</head>
<body>
	
	<table border="0" width="1024" align="center">
	
	<!--顶部 -->
	<tr>
		<td colspan="2">
			<jsp:include page="../common/head.jsp" flush="true"/>
		</td>
	</tr>
	
	<!-- 中间 -->
	<tr>
		<!-- 左边 -->
		<td width="300"   bgcolor="#F5F5F5" valign="top">
			<jsp:include page="../common/left.jsp" flush="true"/>
		</td>
		
		<!-- 右边 -->
		<td width="724" bgcolor="#FFFFFF" valign="top" align="center">
			<div align="left">
				<img src="../../images/systemImages/fg_right03.jpg">
			</div>
	
			<div align="left">
			<%-- 	<jsp:include page="../product/showProductOriginal.jsp" flush="true"/> --%>
				<iframe src="../product/showProductOriginal.jsp" id="container2" name="mainFrame"></iframe>
			</div>
			
			<!-- 
			../product/showProductOriginal.jsp
			../product/showProductDiscount.jsp
			 -->
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<jsp:include page="../common/statusBarNavigation.jsp" flush="true"/>
		</td>
	</tr>
	
	
	</table>
	
</body>
</html>