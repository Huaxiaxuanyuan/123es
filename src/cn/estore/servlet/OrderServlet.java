package cn.estore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import cn.estore.dao.OrderDao;
import cn.estore.dao.OrderItemDao;
import cn.estore.entity.OrderEntity;

public class OrderServlet extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doPost(req, resp);
		HttpSession session = req.getSession(true);
		OrderDao order = new OrderDao();
		OrderItemDao orderDetail = new OrderItemDao();
		String orderAction = req.getParameter("orderAction").toString();
		
		
		//  if(orderAction.equals("orderAbstract")) { List list = new ArrayList();
		  
		  String curUserName = session.getAttribute("name").toString();
		  
		 // list = order.selectOrderByName(curUserName);
		  
		 // req.setAttribute("orderAbstract", list);
		  
		 // req.getRequestDispatcher("pages/order/orderList.jsp").forward(req, resp);; }
		 
		
		// 1.若orderAction中存放的是orderList，表示查看当前用户所有订单信息
					if (orderAction.equals("orderAbstract")) {
						List list = new ArrayList();
						String i = req.getParameter("i");// i用于存放当前订单显示页号
						if (i != null)
							req.setAttribute("i", i);
						// 取得当前在线用户的订单
						if(curUserName!=null)
							list = order.selectOrderByName(curUserName);
						req.setAttribute("orderAbstract", list);
						req.getRequestDispatcher("pages/order/orderList.jsp")
								.forward(req, resp);
					}
					
					// 2.若orderAction中存放的是orderDetails，表示请求查看当前订单的详细信息
					// <a
					// href="OrderServlet?orderAction=orderDetails&orderId=<%=form.getOrderId()%>">详细信息</a>
					if (orderAction.equals("orderDetail")) {
						// 指定用户指定订单号（唯一）的资料
						// userName=session.getAttribute("name").toString();
						String orderId = req.getParameter("orderId").toString();
						//由于orderId是订单关键码，故只此一个字段即可筛选出相关资料
						OrderEntity orderAbstract = order.selectOrderByNumber(orderId);
						req.setAttribute("orderAbstract", orderAbstract);
						// 该用户指定某订单号的详细购物清单,1个orderId一定是属于同一个人订购的
						List list = new ArrayList();
						list = orderDetail.selectOrderDetailByNumber(orderId);
						req.setAttribute("orderItems", list);
						req.getRequestDispatcher("pages/order/orderItemList.jsp")
								.forward(req, resp);
					}
					
					 if (orderAction.equals("orderDelivered")) {
							Boolean b = Boolean.valueOf(req.getParameter("deliverySign"));
							// 生成包含已出或未出订单的list
							String n = session.getAttribute("name").toString();
							List orderDeliveryList = order
									.selectOrderByNameAndDeliverySign(session.getAttribute(
											"name").toString(), b);
							req.setAttribute("orderDeliveryList", orderDeliveryList);
							req.getRequestDispatcher(
									"pages/order/orderListDelivery.jsp").forward(req,resp);
						} 
					 
					 if(orderAction.equals("selectAllOrder")){//查询所有订单
							List list=new ArrayList();
							String i=req.getParameter("i");
							if (i!=null)req.setAttribute("i",i);
							list=order.selectAllOrder();
							req.setAttribute("AllOrder", list);
							req.getRequestDispatcher("pages/admin/order/orderSelect.jsp").forward(req, resp);
						}
	}
	
}
