package cn.estore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.estore.entity.OrderEntity;
import cn.estore.util.DBConnection;

public class OrderDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private DBConnection jdbc = null; // 定义数据库连接对象
	public OrderDao() {
		jdbc = new DBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}
	
	// 添加的方法
		public boolean insertOrder(OrderEntity form) {
			try {
				ps = connection
						.prepareStatement("insert into tb_order values (?,?,?,?,?,?,?,?,?,getDate(),?)");
				ps.setString(1, form.getOrderId());
				ps.setString(2, form.getName());
				ps.setString(3, form.getRealName());
				ps.setString(4, form.getAddress());
				ps.setString(5, form.getMobile());
				ps.setFloat(6, Float.valueOf(form.getTotalPrice()));
				ps.setString(7, form.getDeliveryMethod());
				ps.setString(8, form.getMemo());
				ps.setBoolean(9, form.getDeliverySign());
				ps.setString(10, form.getPaymentMode());
				ps.executeUpdate();
				ps.close();
				return true;
			} catch (SQLException ex) {
				System.out.println("数据库访问失败");
				return false;
			}
		}
		
		// 前台订单查询(按用户名查询)
		public List selectOrderByName(String name) {
			List list = new ArrayList();
			try {
				ps = connection
						.prepareStatement("select * from tb_order where name=?");
				ps.setString(1, name);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					OrderEntity order = new OrderEntity();
					order.setOrderId(rs.getString(1));
					order.setName(rs.getString(2));
					order.setRealName(rs.getString(3));
					order.setAddress(rs.getString(4));
					order.setMobile(rs.getString(5));
					order.setTotalPrice(Float.valueOf(rs.getString(6)));
					order.setDeliveryMethod(rs.getString(7));
					String memo = null;
					try {
						memo = rs.getString(8);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					order.setMemo(memo);
					order.setDeliverySign(rs.getBoolean(9));
					order.setCreateTime(rs.getString(10));
					order.setPaymentMode(rs.getString(11));
					list.add(order);
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return list;
		}
		
		// 以订单号为条件查询信息
		public OrderEntity selectOrderByNumber(String orderId) {

			OrderEntity order = null;
			try {
				ps = connection
						.prepareStatement("select * from tb_order where order_id=?");
				ps.setString(1, orderId);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					order = new OrderEntity();
					order.setOrderId(rs.getString(1));
					order.setName(rs.getString(2));
					order.setRealName(rs.getString(3));
					order.setAddress(rs.getString(4));
					order.setMobile(rs.getString(5));
					order.setTotalPrice(Float.valueOf(rs.getString(6)));
					order.setDeliveryMethod(rs.getString(7));
					String memo = null;
					try {
						memo = rs.getString(8);
					} catch (SQLException e) {
						// doNothing
					}
					order.setMemo(memo);
					order.setDeliverySign(rs.getBoolean(9));
					order.setCreateTime(rs.getString(10));
					order.setPaymentMode(rs.getString(11));
				}
			} catch (SQLException ex) {
			}
			return order;
		}
		
		
		// 以订货单号和出货标志为条件查询信息,
		public List selectOrderByNameAndDeliverySign(String name, Boolean sign) {
			List list = new ArrayList();
			OrderEntity order = null;
			try {
				ps = connection
						.prepareStatement("select * from tb_order where name=? and delivery_sign=? order by  order_id DESC");
				ps.setString(1, name);
				ps.setBoolean(2, sign);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					order = new OrderEntity();
					order.setOrderId(rs.getString(1));
					order.setName(rs.getString(2));
					order.setRealName(rs.getString(3));
					order.setAddress(rs.getString(4));
					order.setMobile(rs.getString(5));
					order.setTotalPrice(Float.valueOf(rs.getString(6)));
					order.setDeliveryMethod(rs.getString(7));
					String memo = null;
					try {
						memo = rs.getString(8);
					} catch (SQLException e) {
						// doNothing
					}
					order.setMemo(memo);
					order.setDeliverySign(rs.getBoolean(9));
					order.setCreateTime(rs.getString(10));
					order.setPaymentMode(rs.getString(11));
					list.add(order);
				}
			} catch (SQLException ex) {
			}
			return list;
		}
		
		// 后台订货查询(所有)
		public List selectAllOrder() {
			List list = new ArrayList();
			try {
				ps = connection.prepareStatement("select * from tb_order");
				ResultSet rs = ps.executeQuery();
				int n = 0;
				while (rs.next()) {
					n++;
					OrderEntity order = new OrderEntity();
					order.setOrderId(rs.getString(1));
					order.setName(rs.getString(2));
					order.setRealName(rs.getString(3));
					order.setAddress(rs.getString(4));
					order.setMobile(rs.getString(5));
					order.setTotalPrice(Float.valueOf(rs.getString(6)));
					order.setDeliveryMethod(rs.getString(7));
					String memo = null;
					try {
						memo = rs.getString(8);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					order.setMemo(memo);
					order.setDeliverySign(rs.getBoolean(9));
					order.setCreateTime(rs.getString(10));
					order.setPaymentMode(rs.getString(11));
					list.add(order);
				}
			} catch (SQLException ex) {
			}
			return list;
		}
}
