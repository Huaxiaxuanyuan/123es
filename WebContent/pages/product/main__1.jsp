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
			System.out.println("���ݿ����ʧ�ܣ�����");
		}
		st = conn.createStatement();
		rs =  st.executeQuery("select * from tb_product order by id desc");
		while(rs.next()){
	%>	
	
	<div align="center">
		<img src="<%="../../images/productImages/"+rs.getString("picture")%>" width="110" height="100"/>
	</div>
	<div align="center">
		��Ʒ��<%=rs.getString("name") %>
	</div>
	<div align="center">
		���ۣ�<%=rs.getString("market_price") %>
	</div>
	<div align="center">
		��飺<%=rs.getString("description") %>
	</div>
	
	<%
	}
		rs.close();
		st.close();
		conn.close();
		
	%>
	<br>
	��¼����ܹ���
		
	
</body>
</html>