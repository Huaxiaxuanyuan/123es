<%@page import="cn.estore.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
</head>

<%
	String userlink = "/estore/pages/customer/userLoginPlease.jsp";
	String shoppinglink = "/estore/pages/customer/userLoginPlease.jsp";
	String orderlink = "/estore/pages/customer/userLoginPlease.jsp";
	CustomerEntity user = null;
	if(session.getAttribute("user")!=null){
		user = (CustomerEntity)session.getAttribute("user");
		userlink = "/estore/pages/customer/userUpdate.jsp?name="+user.getUserName();
		shoppinglink = "/estore/pages/cart/cartShow.jsp";
		orderlink = "/estore/OrderServlet?orderAction=orderAbstract";//发起查看当前用户所有订单请求 (用完成servlet/javabean/jsp)  
	}
	
	
	
	
%>

<body>
	<table width="1024"  bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#819BBC" bgcolor="#ffff" border="0"
	 align="center" cellpadding="0" cellspacing="0" background="<%=request.getContextPath() %>/images/systemImages/fg_top03.jpg">
		<tr align="center" height="30">
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/main.jsp">首页</a>
			</td>
			
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/showProductOriginal.jsp" class="a4" target="mainFrame" id="container2">商城新品</a>
			</td>
			
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/showProductDiscount.jsp" class="a4" target="mainFrame" id="container2">特价商品</a>
			</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=shoppinglink%>" class="a4">购物车</a>
				</td>
			
			<td width="100"
				    onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=orderlink%>" class="a4">订单查看</a>
				</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=userlink%>" class="a4">用户修改</a>
			</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="/estore/pages/admin/userLogin.jsp" class="a4">订单管理</a>
				</td>
		</tr>
	</table>
</body>
</html>