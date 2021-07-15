<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.cart.CartGoods" %>
<%@ page import="cn.estore.dao.ProductDao" %>
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>

<%
	Vector cart = (Vector)session.getAttribute("_CART_");

	Vector newcart = new Vector();
	
	for(int i=0;i<cart.size();i++){
		CartGoods cartGoods=(CartGoods)cart.elementAt(i);
		String num=request.getParameter("num"+i);
		try{
		int newnum=Integer.parseInt(num);
		cartGoods.number=newnum;
		if(newnum!=0){
			newcart.addElement(cartGoods);}
		}catch(Exception e){
			out.println("<script language='javascript'>alert('您输入的数量不是有效的整数!');history.back();</script>");
			return;
		}
	}
	session.setAttribute("_CART_",newcart);
	response.sendRedirect("cartShow.jsp");
%>

<body>
	
</body>
</html>