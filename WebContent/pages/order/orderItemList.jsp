<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.estore.entity.OrderEntity"%>
<%@page import="cn.estore.entity.OrderItemEntity"%>
<html>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
<%
	//��ѯ���嶩������ϸ��Ϣ
	String number = request.getParameter("orderId");//���ն������
   //���պ�̨servler���صĲ���������������Ϣ��
	OrderEntity orderEntity = (OrderEntity) request.getAttribute("orderAbstract");//����ת��		
	//���պ�̨servler���صĲ�����������ϸ��Ϣ��	
	List list = (List) request.getAttribute("orderItems");

%>
<body>
<table width="1024" border="0" align="center" cellpadding="0"
			cellspacing="0">

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
					<br>
					<table width="723" height="25" border="0" cellpadding="0"
						cellspacing="0"
						background="<%=request.getContextPath()%>/systemImages/bg_02.jpg">
						<tr>
							<td align="center">
								<strong>������Ϊ��<%=orderEntity.getOrderId()%>&nbsp;&nbsp;����ϸ��Ϣ</strong>
							</td>
						</tr>
					</table>
					<br>
					<table width="76%" border="1" cellpadding="1" cellspacing="1"
						bordercolor="#FFFFFF" bgcolor="#DCDCDC">
						<tr align="center">
							<td width="26%" height="25">
								�û��˺�
							</td>
							<td width="22%" bgcolor="#FFFFFF"><%=orderEntity.getName()%></td>
							<td width="26%">
								�û�����
							</td>
							<td width="22%" bgcolor="#FFFFFF"><%=orderEntity.getRealName()%></td>
						</tr>
						<tr align="center">
							<td height="25">
								�ͻ��绰
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getMobile()%></td>
							<td>
								�ͻ���ַ
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getAddress()%></td>
						</tr>
						<tr align="center">
							<td height="25">
								���ʽ
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getPaymentMode()%></td>
							<td>
								���ͷ�ʽ
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getPaymentMode()%></td>
						</tr>
						<tr align="center">
							<td height="25">
								��ע��Ϣ
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getMemo()%></td>
							<td>
								����ʱ��
							</td>
							<td bgcolor="#FFFFFF"><%=orderEntity.getCreateTime()%></td>
						</tr>
					</table>
					<br>
					
					<hr align="center" size="3" width="76%" color="brown" noshade/>

					<strong>��Ʒ��ϸ��Ϣ</strong>
					<br>
					<br>
					<table width="74%" border="1" cellpadding="1" cellspacing="1"
						bordercolor="#FFFFFF" bgcolor="#DCDCDC">
						<tr>
							<td>
								<div align="center">
									��Ʒ����
								</div>
							</td>
							<td>
								<div align="center">
									��Ʒ����
								</div>
							</td>
							<td>
								<div align="center">
									��Ʒ�۸�
								</div>
							</td>
						</tr>
						<%
							float sum = 0;
							for (int i = 0; i < list.size(); i++) {
								OrderItemEntity form = (OrderItemEntity) list.get(i);
								sum = sum + form.getAmount() * form.getProductPrice();
						%>
						<tr bgcolor="#FFFFFF">
							<td>
								<div align="center"><%=form.getProductName()%></div>
							</td>
							<td>
								<div align="center"><%=form.getAmount()%></div>
							</td>
							<td>
								<div align="center"><%=form.getProductPrice()%>Ԫ
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<br/><br/><br/><br/>

					<table width="20%" border="0" align="center">
						<tr>
							<td align="right"><font color="red" >�ϼƽ��:</font></td>
							<td align="left"><%=sum%></td>
						</tr>
						<tr>
							<td align="right"><font color="red" >����״̬:</font></td>
							<td align="left">
									<%
										if (orderEntity.getDeliverySign()) {
									%>
									��
									<%
										} else {
									%>
									��
									<%
										}
									%>
								</td>
						</tr>
						<tr>
							<td align="right" colspan="2">
									<a href="javascript:history.go(-1)"><font color="blue" >����</font></a>
							</td>
						</tr>
					</table>
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