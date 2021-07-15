<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.ProductEntity" %>
<%@ page import="cn.estore.dao.ProductDao" %>
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>findProductsByName</title>
</head>
<body>

<table width="300" height="152" border="0" align="center"
 background="<%=request.getContextPath() %>/images/systemImages/fg_left00.jpg">
	
	
	
	
	<tr>
		<td width="100" align="left" valign="bottom">
			&nbsp;&nbsp;
		</td>
	</tr>
	
	<tr>
		<td width="100" align="left" valign="bottom">
			&nbsp;&nbsp;搜索商品
		</td>
	</tr>
	
	
	<tr>
		<td>
			<form name="searchForm" method="post" 
			action="<%=request.getContextPath() %>/pages/product/showFindProductsByName.jsp"
			onsubmit="return checkEmpty(searchForm)">
				<table>
					<tr>
						<td>
							&nbsp;&nbsp;
						</td>
						
						<td>
							<input name="search" type="text" size="22" align="left">
						</td>
						
						<td>
							<a href="<%=request.getContextPath() %>/pages/product/showFindProductsByName.jsp"  target="mainFrame" id="container2"><input type="image" class="input1" src="<%=request.getContextPath() %>/images/systemImages/Search.gif" align="middle"></a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	
</table>

</body>
</html>