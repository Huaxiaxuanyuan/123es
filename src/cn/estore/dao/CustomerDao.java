package cn.estore.dao;
import java.sql.*;
import java.util.*;
import cn.estore.entity.CustomerEntity;
import cn.estore.util.DBConnection;
import cn.estore.util.Encrypt;


public class CustomerDao {
	
	private Connection connection = null;
	private DBConnection jdbc = null;
	private PreparedStatement ps = null;
	
	public CustomerDao() {
		jdbc = new DBConnection();
		connection = jdbc.connection;
	}
	
	public CustomerEntity selectCustomerEntity(String name) {
		CustomerEntity user = null;
		try {
			String url = "select * from tb_customer where user_name=?";
			ps = connection.prepareStatement(url);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new CustomerEntity();
					
				user.setId(Integer.valueOf(rs.getString(1)));
				user.setUserName(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setRealName(rs.getString(4));
				user.setMobile(rs.getString(5));
				user.setEmail(rs.getString(6));
				user.setPasswordQuestion(rs.getString(7));
				user.setPasswordHintAnswer(rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("数据库访问失败！！！");
		}

			return user;
		
	}
	
	public CustomerEntity selectFind(String name,String result) {
		CustomerEntity user = null;
		try {
			String url = "select * from tb_customer where name=? and result=?";
			ps = connection.prepareStatement(url);
			ps.setString(1, name);
			ps.setString(2, result);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new CustomerEntity();
					
				user.setId(Integer.valueOf(rs.getString(1)));
				user.setUserName(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setRealName(rs.getString(4));
				user.setMobile(rs.getString(5));
				user.setEmail(rs.getString(6));
				user.setPasswordQuestion(rs.getString(7));
				user.setPasswordHintAnswer(rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("数据库访问失败！！！");
		}

			return user;
		
	}
	
	public boolean updatePassword(String password,Integer id) throws Exception {
		
		Encrypt des = new Encrypt("njcit");
		String pswDecrypt=des.encrypt(password);
		
		
		try {
			ps = connection.prepareStatement("update tb_customer set password=? where id=?");
			ps.setString(1, pswDecrypt);
			ps.setInt(2, id.intValue());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public boolean insertCustomer(CustomerEntity user) {
		
		String url = "insert into tb_customer(user_name,password,real_name,mobile,email,password_question,password_hint_answer)"
				+ "values(?,?,?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(url);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRealName());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPasswordQuestion());
			ps.setString(7, user.getPasswordHintAnswer());
			ps.executeUpdate();
			ps.close();
			
			return true;
			
		} catch (SQLException e) {
			return false;
		}
		
	}
	
	  //查询数据库是否存在相同信息
	   public  boolean hasSameValue(String name, String value) {
	        boolean result = false;  //保存检测结果
	        try {	    	
	        	ps= connection.prepareStatement( "select * from tb_customer where " + name + " = ?");
	            ps.setString(1, value);          //设置参数
	            ResultSet rs = ps.executeQuery(); //执行查询，返回结果集
	            //根据结果集是否存在决定查询结果
	            if (rs.next()) {
	                result = true;
	            } else {
	                result = false;
	            }
	        } catch (SQLException e) {
	            System.out.println(e.toString());
	        } finally {

	        }
	        return result;
	    }
	   
	   public boolean updateCustomer(CustomerEntity user) {
		   
		   String sql = "update tb_customer set user_name=?,password=?,real_name=?,mobile=?,email=?,"
		   		+ "password_question=?,password_hint_answer=? where id=?";
		   try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRealName());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPasswordQuestion());
			ps.setString(7, user.getPasswordHintAnswer());
			ps.setString(8, String.valueOf(user.getId()));
			
			System.out.println(user.getUserName()+String.valueOf(user.getId()));
			
			ps.executeUpdate();
			
			ps.close();
			return true;
			
		} catch (SQLException e) {
			return false;
		}
		   
		   
	   }
}
