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
<title>Insert title here</title>
</head>
<body>
	<%
		ProductDao pdDao = new ProductDao();
	
		/* 将查询结果存入list对象 */
		List proList = (List)pdDao.selectAllProducts();
		
		for(int i = 0;i<proList.size();i++){
			/* 遍历结果集 */
			ProductEntity e = (ProductEntity)proList.get(i);
			
		
	%>	
	
	<table width="95%" height="136" border="1" align="center" cellpadding="1"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
		
		<tr>
			<td width="40%" height="80" rowspan="5" bgcolor="#FFFFFF">
				<div align="center">
					<img src="<%="../../images/productImages/"+e.getPicture()%>" width="110" height="100"/>
				</div>
			</td>
			
			<td width="59%" bgcolor="#FFFFFF">
				<div align="left"> 商品：<%=e.getName() %></div>
				<div align="left">单价：<%=e.getMarketPrice() %>元</div>
				<div align="left">简介：<%=e.getDescription() %></div>
				<div align="left"> 登录才能购买</div>
			</td>
		</tr>
	</table>
	
	
	<%
		}

	%>
	<br>
	
		
	
</body>
</html>