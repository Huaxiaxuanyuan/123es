package cn.estore.util;

import java.sql.*;

public class DBConnection {

	private String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url = "jdbc:sqlserver://localhost:1433;DatabaseName=estoredb"; 
//	private String url = "jdbc:sqlserver://localhost:1433;integratedSecurity=true;DatabaseName=estoredb"; 
	public Connection connection = null;
	
	public DBConnection() {
		try {
			//加载数据库驱动
			Class.forName(dbDriver);
			connection = DriverManager.getConnection(url, "sa","951013");
//			connection = DriverManager.getConnection(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("数据库加载失败！！！");
		}	
	}
	
	
}
