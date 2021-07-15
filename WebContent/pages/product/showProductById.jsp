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

<%
	ProductDao dao = new ProductDao();
	ProductEntity goods = (ProductEntity)dao.selectOneProducts(Integer.valueOf(request.getParameter("id")));
%>

<body>
	<form name="form" method="post" action="../cart/cartAdd.jsp">
			<div align="center">
				<p class="style1">
					查看商品详细信息
				</p>
			</div>
			<table width="320" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
				bordercolordark="#819BBC" align="center" valign="middle">
				<tr>
					<td width="36%" rowspan="4" height="120">
						<div align="center">
						<%
							String tempImg=request.getContextPath().trim()+"/images/productImages/"+goods.getPicture();
						%>
							<input name="pricture" type="image" src="<%=request.getContextPath()%>/images/productImages/<%=goods.getPicture()%>" width="110" height="100">
						</div>
					</td>
				
					<td width="64%" height="30">
						<div align="center">
							<table width="71%" height="20" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td>
										商品名称：<%=goods.getName()%>
										<input type="hidden" name="goodsId" value="<%=goods.getId()%>" />
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30">
						<div align="center">
							<table width="71%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td>
										<%
											if (String.valueOf(goods.getDiscount()).equals("1")) {
										%>
										特&nbsp;&nbsp;&nbsp;&nbsp;价：<%=goods.getSellPrice()%>元
										<input type="hidden" name="price"
											value="<%=goods.getSellPrice()%>" />
										<%
											} else {
										%>
										现&nbsp;&nbsp;&nbsp;&nbsp;价：<%=goods.getMarketPrice()%>元
										<input type="hidden" name="price"
											value="<%=goods.getMarketPrice()%>" />
										<%
											}
										%>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30">
						<div align="center">
							<table width="71%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td>
										简&nbsp;&nbsp;&nbsp;&nbsp;介：<%=goods.getDescription()%>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr align="center">
					<td height="30">
						<img src="<%=request.getContextPath() %>/images/systemImages/1.jpg" onClick="window.close()">
						&nbsp;&nbsp;
						<input type="image" src="<%=request.getContextPath() %>/images/systemImages/2.jpg" name="Submit" value="放入购物车">
					</td>

				</tr>
			</table>
		</form>
</body>
</html>