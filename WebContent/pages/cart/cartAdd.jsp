<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.entity.ProductEntity" %>
<%@ page import="cn.estore.cart.CartGoods" %>
<%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>


<%
	//��ȡrequest�е�ĳ��Ʒ��ż���Ʒ�۸�
	int goodsID = Integer.parseInt(request.getParameter("goodsId"));
	float goodsPrice = Float.parseFloat(request.getParameter("price"));
	//ѡ��Ʒ����
	int buyGoodsNumber=1;
	//������Ʒ����Ĭ��ÿ��ѡһ������
	CartGoods cartGoods = new CartGoods(goodsID,goodsPrice,buyGoodsNumber);	

	boolean flag = true;
	
	//�жϸ��û��Ƿ��Ѿ��й��ﳵ
	Vector cart = (Vector) session.getAttribute("_CART_");
	if (cart == null) {
		cart = new Vector();//�½����ﳵ
	} else {
		for (int i = 0; i < cart.size(); i++) {
			CartGoods boughtGoods = (CartGoods) cart.elementAt(i);
			if (boughtGoods.ID == cartGoods.ID) {
				boughtGoods.number++;
				cart.setElementAt(boughtGoods, i);
				flag = false;
			}
		}
	}
	//ԭ���ﳵ��û��Ҫ��ӵ���Ʒ
	if (flag)
		cart.add(cartGoods);
	session.setAttribute("_CART_", cart);

	out.println("<script language='javascript'> window.close(); alert('������Ʒ�ɹ�!');</script>");
%>

<body>

</body>
</html>