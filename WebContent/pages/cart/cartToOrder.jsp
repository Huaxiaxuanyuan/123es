<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="cn.estore.cart.CartGoods"%>
<%@ page import="cn.estore.entity.OrderEntity"%>
<%@ page import="cn.estore.entity.OrderItemEntity"%>
<%@ page import="cn.estore.dao.ProductDao"%>
<%@ page import="cn.estore.dao.OrderDao"%>
<%@ page import="cn.estore.dao.OrderItemDao"%>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="1024" align="center">

			<tr>
				<td colspan="2">
					<jsp:include page="../common/head.jsp" flush="true" />
				</td>
			</tr>

			<tr>
				<td width="300" bgcolor="#F5F5F5" valign="top">
					<!--���01-->
					<jsp:include page="../common/left.jsp" flush="true" />
				</td>

				<td width="724" align="center" valign="top" bgcolor="#FFFFFF">
					<!--�Ҳ�01-->

					<%
						//���ͻ����ﳵ�������ύ������
						OrderEntity order = new OrderEntity();
						OrderDao orderDao = new OrderDao();
						OrderItemDao orderDetailDao = new OrderItemDao();
						OrderItemEntity orderDetail = new OrderItemEntity();
						ProductDao goodsDao = new ProductDao();

						String orderId = session.getAttribute("orderId").toString();
						//����Ӷ�����
						order.setOrderId(orderId);
						order.setName(request.getParameter("name"));
						order.setRealName(request.getParameter("realName"));
						order.setAddress(request.getParameter("address"));
						order.setMobile(request.getParameter("mobile"));
						order.setTotalPrice(Float.valueOf(session
								.getAttribute("totalPrice").toString()));
						order.setDeliveryMethod(request.getParameter("deliveryMethod"));
						order.setMemo(request.getParameter("memo"));
						order.setDeliverySign(false);//Ĭ��û����
						//������ʱ���ʽ��Ϊ"yyyy-MM-dd HH:mm:ss",������ǰʱ���ֶ���
						java.util.Date date = new java.util.Date();
						java.text.SimpleDateFormat orderTime = new java.text.SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						order.setCreateTime(orderTime.format(date));
						order.setPaymentMode(request.getParameter("paymentMode"));
						//����������
						orderDao.insertOrder(order);

						//�������漰����Ʒ��ӵ��ö������������ϸ��
						Vector cart = (Vector) session.getAttribute("_CART_");
						for (int i = 0; i < cart.size(); i++) {
							CartGoods cartGoods = (CartGoods) cart.elementAt(i);
							//��һ������ϸ��������Ʒ�Ķ����ž�һ����ͬ�������еĶ�����
							orderDetail.setOrderId(orderId);
							orderDetail.setProductId(new Integer(cartGoods.ID));
							orderDetail.setProductName(goodsDao
									.selectOneNameByProductId(new Integer(cartGoods.ID)));
							orderDetail.setProductPrice(cartGoods.price);
							orderDetail.setAmount(cartGoods.number);
							//�޸ĸ���Ʒ���������ں���ͳ����������
							goodsDao.updateAProductSoldNumber(cartGoods.number,
									new Integer(cartGoods.ID));
							orderDetailDao.insertOrderItem(orderDetail);
						}

						session.removeAttribute("_CART_");
						//��5����ת��cartClear.jspҳ�棬���Ը��ͻ���¼����
						//response.setHeader("refresh", "5 ; url=cartClear.jsp");
						//response.write("<script>alert('����ʧ��'+result+'')</script>");
						//response.write("<script>alert(\"+result+\")</script>");
						//out.println("<script language='javascript'>alert('�µ��ɹ������ס�������:');window.location.href='cartClear.jsp';</script>"	);
						
						//response.sendRedirect("../product/main.jsp");
					%>
					
					<table>
						<tr>
							<td height="100"> </td>
						</tr>
						<tr>
							<td align="center">
								<font color="red" size="5">�Ѿ����ɶ��������:<%=orderId%></font>
							</td>
						</tr>
					</table>
					
					<div align="center">
						<%--���δ��[��¼��������ҳ������ǰҳ��--%>
					</div>

				</td>
			</tr>

			<tr>
				<td colspan="2">
					<jsp:include page="../common/statusBarNavigation.jsp" flush="true" />
				</td>
			</tr>

		</table>
</body>
</html>