package cn.estore.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 * 定义数据库商品信息表操作类
 * @author weimo
 *
 */

import cn.estore.entity.ProductEntity;
import cn.estore.util.DBConnection;
public class ProductDao {
	
	private Connection connection = null;
	private DBConnection jDbConnection = null;
	
	private PreparedStatement pStatement = null;
	
	public ProductDao() {
		jDbConnection = new DBConnection();
		connection = jDbConnection.connection;
	}
	
	
	/**
	 * 先获取一个执行完SQL语句的结果集，然后创建一个商品对象，将结果集中的数据一条一条赋给商品对象，最后将此对象作为返回值
	 * @return 返回一个商品的实体类(对象)
	 */
	public List selectAllProducts() {
		List list = new ArrayList();
		ProductEntity entity  = null;
		try {
			String sql = "select * from tb_Product order by id desc";
			pStatement  = connection.prepareStatement(sql);
			ResultSet rSet = pStatement.executeQuery();
			
			while(rSet.next()) {
				//每一个商品对象保存一条rset里面的数据
				entity = new ProductEntity();
				
				entity.setId(rSet.getInt(1));
				entity.setCategoryMainId(rSet.getInt(2));
				entity.setCategoryBranchId(rSet.getInt(3));
				entity.setName(rSet.getString(4));
				entity.setProducingArea(rSet.getString(5));
				entity.setDescription(rSet.getString(6));
				entity.setCreateTime(rSet.getString(7));
				entity.setMarketPrice(rSet.getFloat(8));
				entity.setSellPrice(rSet.getFloat(9));
				entity.setProductCount(rSet.getInt(10));
				entity.setPicture(rSet.getString(11));
				entity.setDiscount(rSet.getInt(12));
				
				//将ProductEntity实例加入list中
				list.add(entity);
			}
		} catch (SQLException e) {
			System.out.println("数据库访问失败");
		}
		
		return list;
	}
	
	
	/**
	 * 将ResultSet结果集转为list
	 * @param rSet
	 * @return
	 */
	public List Rs2List(ResultSet rSet) {
		List list = new ArrayList();
		ProductEntity entity  = null;
	try {
		while(rSet.next()) {
			//每一个商品对象保存一条rset里面的数据
			entity = new ProductEntity();
			
			entity.setId(rSet.getInt(1));
			entity.setCategoryMainId(rSet.getInt(2));
			entity.setCategoryBranchId(rSet.getInt(3));
			entity.setName(rSet.getString(4));
			entity.setProducingArea(rSet.getString(5));
			entity.setDescription(rSet.getString(6));
			entity.setCreateTime(rSet.getString(7));
			entity.setMarketPrice(rSet.getFloat(8));
			entity.setSellPrice(rSet.getFloat(9));
			entity.setProductCount(rSet.getInt(10));
			entity.setPicture(rSet.getString(11));
			entity.setDiscount(rSet.getInt(12));
			
			//将ProductEntity实例加入list中
			list.add(entity);
		}
	} catch (SQLException e) {
		System.out.println("Rs转换List失败");
	}
		return list;
	}
	
	/**
	 * 查看打折商品
	 * @param discount
	 * @return 把通过数据库查询出来的打折商品，封装进list
	 */
	public List selectProductsDiscount(Integer discount) {
		List list = new ArrayList();
		
		String url="select * from tb_product where discount=? order by id DESC";
		
		try {
			pStatement = connection.prepareStatement(url);
			pStatement.setInt(1, discount.intValue());
			ResultSet rs = pStatement.executeQuery();
			
			list = Rs2List(rs);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return list;
	}
	
	public List selectProductsSearch(String search) {
		List list = new ArrayList();
		ProductEntity goodsEntity = null;
		String urlString = "select * from tb_product where name like '%"+search+"%' order by id DESC";
		 try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(urlString);
			list = Rs2List(rs);
		} catch (SQLException e) {
			System.out.println("数据库访问失败！！！");
		}
		 
		 return list;
	}
	
	
	
	
	public ProductEntity selectOneProducts(int id) {
		
		ProductEntity e = new ProductEntity();
		
		String sql = "select * from tb_product where id=? order by id DESC";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			
			ResultSet rs = pStatement.executeQuery();
			
			while(rs.next()) {
				e.setId(rs.getInt(1));
				e.setCategoryMainId(rs.getInt(2));
				e.setCategoryBranchId(rs.getInt(3));
				e.setName(rs.getString(4));
				e.setProducingArea(rs.getString(5));
				e.setDescription(rs.getString(6));
				e.setCreateTime(rs.getString(7));
				e.setMarketPrice(rs.getFloat(8));
				e.setSellPrice(rs.getFloat(9));
				e.setProductCount(rs.getInt(10));
				e.setPicture(rs.getString(11));
				e.setDiscount(rs.getInt(12));
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return e;
		
	}
	
	
	// 以商品编号查询商品名称
		public String selectOneNameByProductId(int id) {
			String name = null;
			try {
				pStatement = connection.prepareStatement("select * from tb_product where id=?");
				pStatement.setInt(1, id);
				ResultSet rs = pStatement.executeQuery();
				while (rs.next()) {
					name = rs.getString(4);
				}
			} catch (SQLException ex) {
			}
			return name;
		}
	
		// 根据商品的ID修改商品的销售数量
		public boolean updateAProductSoldNumber(int productAmount, int id) {
			try {
				pStatement = connection
						.prepareStatement("update tb_product set product_amount=product_amount+? where id=?");
				pStatement.setInt(1, productAmount);
				pStatement.setInt(2, id);
				pStatement.executeUpdate();
				pStatement.close();
				return true;
			} catch (SQLException ex) {
				System.out.println("更新数据表商品销量失败！");
				return false;
			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
