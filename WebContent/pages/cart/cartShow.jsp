<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"
    import="java.sql.*"
%>
<%@ page import="cn.estore.cart.CartGoods" %>
<%@ page import="cn.estore.dao.ProductDao" %>
<%@ page import="java.util.*"  %>

<%
	ProductDao dao = new ProductDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>

<link href="../../css/css.css" rel="stylesheet" type="text/css">
<body>
<jsp:include page="../common/head.jsp" flush="true" />
		<table width="1024" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="300" bgcolor="#F5F5F5">
					<!--���01-->
					<jsp:include page="../common/left.jsp" flush="true" /></td>
				<td width="724" valign="top" bgcolor="#FFFFFF" align="center">
					<!--�Ҳ�01-->

					<br>
					<br>
					<strong>�ҵĹ��ﳵ</strong>
					<div align="center">
						<br>
						<%
							if (session.getAttribute("_CART_") == null) {
						%>
						����û�й������
						<%
							} else {
						%>
					</div>
					<form method="post" action="cartModify.jsp" name="form">
						<table width="92%" border="1" align="center" cellpadding="0"
							cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#819BBC"
							bordercolorlight="#FFFFFF">
							<tr>
								<td width="5%" height="28">
									<div align="center">
										���
									</div>
								</td>
								<td width="40%">
									<div align="center">
										��Ʒ������
									</div>
								</td>
								<td width="18%">
									<div align="center">
										��Ʒ�۸�
									</div>
								</td>
								<td width="19%">
									<div align="center">
										��Ʒ����
									</div>
								</td>
								<td width="18%">
									<div align="center">
										��Ʒ���
									</div>
								</td>
							</tr>
							<%
								float sum = 0;//��Ʒ�ܽ��
									//��ȡsession�еĹ��ﳵ
									Vector cart = (Vector) session.getAttribute("_CART_");
									//�ۼ�������Ʒ�����ܶ�
									for (int i = 0; i < cart.size(); i++) {
										CartGoods cartGoods = (CartGoods) cart.elementAt(i);
										sum = sum + cartGoods.number * cartGoods.price;
							%>

							<tr>
								<td align="center" width="5%">
									<%=i + 1%>
								</td>
								<td align="center" width="40%">
									<%=dao.selectOneNameByProductId(new Integer(cartGoods.ID))%>
								</td>
								<td align="center" width="18%">
									<%=cartGoods.price%>Ԫ
								</td>
								<td align="center" width="19%">
									<input name="num<%=i%>" size="7" type="text"
										value="<%=cartGoods.number%>" onBlur="check(this.form)">
								</td>
								<td align="center" width="18%">
									<%=cartGoods.number * cartGoods.price%>Ԫ
								</td>
							</tr>

							<script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("�벻Ҫ����Ƿ��ַ�");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("�������޸ĵ�����");myform.num<%=i%>.focus();return;}
				myform.submit();
			}
			-->
		</script>

							<%
								}
							%>
						</table>

					</form>

					<table width="100%" height="52" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr align="center" valign="middle">
							<td height="10">
								&nbsp;
							</td>
							<td width="24%" height="10" colspan="-3" align="left">
								&nbsp;
							</td>
						</tr>
						<tr align="center" valign="middle">
							<td height="21" class="tableBorder_B1">
								&nbsp;
							</td>
							<td height="21" colspan="-3" align="left">
								�ϼ��ܽ���<%=sum%>
								<%
									session.setAttribute("totalPrice", sum);
								%>
							</td>

						</tr>
						<tr align="center" valign="middle">
							<td height="21" colspan="2">
								<a href="../product/main.jsp">��������</a> |
								<a href="../cart/cartCheckOut.jsp">ȥ����̨����</a> |
								<a href="../cart/cartClear.jsp">��չ��ﳵ</a> |
								<a href="#">�޸����� </a>
							</td>
						</tr>
					</table>
					<%
						}
					%>

				</td>
			</tr>
		</table>
		<jsp:include page="../common/statusBarNavigation.jsp" flush="true" />
</body>
</html>