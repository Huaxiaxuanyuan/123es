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
					�鿴��Ʒ��ϸ��Ϣ
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
										��Ʒ���ƣ�<%=goods.getName()%>
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
										��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�<%=goods.getSellPrice()%>Ԫ
										<input type="hidden" name="price"
											value="<%=goods.getSellPrice()%>" />
										<%
											} else {
										%>
										��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�<%=goods.getMarketPrice()%>Ԫ
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
										��&nbsp;&nbsp;&nbsp;&nbsp;�飺<%=goods.getDescription()%>
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
						<input type="image" src="<%=request.getContextPath() %>/images/systemImages/2.jpg" name="Submit" value="���빺�ﳵ">
					</td>

				</tr>
			</table>
		</form>
</body>
</html>