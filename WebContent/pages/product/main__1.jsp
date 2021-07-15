<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection  conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;DatabaseName=estoredb";
			conn = DriverManager.getConnection(url,"sa","951013");
		}catch(Exception ex){
			System.out.println("数据库加载失败！！！");
		}
		st = conn.createStatement();
		rs =  st.executeQuery("select * from tb_product order by id desc");
		while(rs.next()){
	%>	
	
	<div align="center">
		<img src="<%="../../images/productImages/"+rs.getString("picture")%>" width="110" height="100"/>
	</div>
	<div align="center">
		商品：<%=rs.getString("name") %>
	</div>
	<div align="center">
		单价：<%=rs.getString("market_price") %>
	</div>
	<div align="center">
		简介：<%=rs.getString("description") %>
	</div>
	
	<%
	}
		rs.close();
		st.close();
		conn.close();
		
	%>
	<br>
	登录后才能购买
		
	
</body>
</html>