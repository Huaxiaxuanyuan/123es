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
	ProductDao dao = new ProductDao();
	request.setCharacterEncoding("GB2312");
	String search = request.getParameter("search");
	List searchList = (List)dao.selectProductsSearch(search.trim());
	
	int pageNumber = searchList.size();
	int maxPage = pageNumber;
	
	String strNumber = request.getParameter("pageNum");
	
	int number = 0;
	
	if(maxPage % 4 == 0)
	{
		maxPage = maxPage / 4;
	}else{
		maxPage = maxPage / 4 + 1;
	}
	
	if(strNumber == null){
		number = 0;
	}else{
		number = Integer.parseInt(strNumber);
	}
	
	int start = number*4;
	
	int over = (number+1)*4;
	
	int count = pageNumber-over;
	
	if(count <= 0){
		over = pageNumber;
	}
%>


<%
	for(int i=start;i<over;i++){
		ProductEntity e = (ProductEntity)searchList.get(i);
	
%>
<table width="95%" height="136" border="1" align="center" cellpadding="1"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
		<tr>
			<td width="40%" height="80" rowspan="5" bgcolor="#FFFFFF">
				<div align="center">
					<img src="<%="../../images/productImages/"+e.getPicture()%>" width="110" height="100"/>
				</div>
			</td>
			
			<td width="59%"  height="100%" bgcolor="#FFFFFF">
				<div align="left"> 商品：<%=e.getName() %></div>
				<div align="left">单价：<%=e.getMarketPrice() %>元</div>
				<div align="left">简介：<%=e.getDescription() %></div>
				
				<div align="left">
					<%
						if (session.getAttribute("user") != null|| session.getAttribute("id") != null) {
					%>
					<a href="#" onClick="window.open('showProductById.jsp?id=<%=e.getId()%>','','width=500,height=200');">查看详细内容</a>
					
					<%} else {
					%>
				 登录后才能购买
				<%
				 }
				%>
				
				<!-- <div align="left"> 登录才能购买</div> -->
			</td>
		</tr>
</table>


<div align="center">
	<table>
	<%}%>
	<tr> 
	<td width="13%"> 共为<%=maxPage %>页 </td>
	<td width="18%"> 共有<%=pageNumber %>条记录</td>
	<td width="26%"> 当前为第<%=number+1 %>页</td>
	<td width="15%">
	
	<%
		if((number+1)==1){
	%>
	上一页
	<%}else{ %>
	
	<a href="showFindProductsByName.jsp?pageNum=<%=number-1%>">上一页</a>
	</td>
	
	<%} %>
	
	<td width="14%">
	<%
		if(maxPage <= (number+1)) {
	%>
	下一页
	<% }else{ %>
	
	<a href="showFindProductsByName.jsp?pageNum=<%=number+1%>">下一页</a>
	</td>
	<% } %>
	</td>
	</tr>
	</table>
</div>
</body>
</html>