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
		orderlink = "/estore/OrderServlet?orderAction=orderAbstract";//����鿴��ǰ�û����ж������� (�����servlet/javabean/jsp)  
	}
	
	
	
	
%>

<body>
	<table width="1024"  bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#819BBC" bgcolor="#ffff" border="0"
	 align="center" cellpadding="0" cellspacing="0" background="<%=request.getContextPath() %>/images/systemImages/fg_top03.jpg">
		<tr align="center" height="30">
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/main.jsp">��ҳ</a>
			</td>
			
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/showProductOriginal.jsp" class="a4" target="mainFrame" id="container2">�̳���Ʒ</a>
			</td>
			
			<td width="100" onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath() %>/images/systemImages/topMenu.jpg)'"
			onMouseOut="this.style.backgroundImage=''">
			<a href="<%=request.getContextPath() %>/pages/product/showProductDiscount.jsp" class="a4" target="mainFrame" id="container2">�ؼ���Ʒ</a>
			</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=shoppinglink%>" class="a4">���ﳵ</a>
				</td>
			
			<td width="100"
				    onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=orderlink%>" class="a4">�����鿴</a>
				</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="<%=userlink%>" class="a4">�û��޸�</a>
			</td>
			
			<td width="100"
					onMouseOver="this.style.backgroundImage='url(<%=request.getContextPath()%>/images/systemImages/topMenu.jpg)'"
					onMouseOut="this.style.backgroundImage=''">
					<a href="/estore/pages/admin/userLogin.jsp" class="a4">��������</a>
				</td>
		</tr>
	</table>
</body>
</html>