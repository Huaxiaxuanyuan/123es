<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="cn.estore.dao.OrderDao"%>
<%@page import="cn.estore.entity.OrderEntity"%>
<html>
<%
	//��ѯ��ǰ�û����еĶ���
	OrderDao order = new OrderDao();
	List list = null;
	
	//ȡ�ó�����δ��������	
	list = (List)request.getAttribute("orderDeliveryList");
	
	int pageNumber = list.size(); // ������ж�������¼
	int maxPage = pageNumber; // �����ж���ҳ��
	String strNumber = (String) request.getAttribute("i");
	int number = 0;
	if (maxPage % 10 == 0) {
		maxPage = maxPage / 19;
	} else {
		maxPage = maxPage / 10 + 1;
	}
	if (strNumber == null) {
		number = 0;
	} else {
		number = Integer.parseInt(strNumber);
	}
	int start = number * 10;//��ʼ����
	int over = (number + 1) * 10;//��������
	int count = pageNumber - over;//��ʣ��������¼
	if (count <= 0) {
		over = pageNumber;
	}
%>
<head>
<meta charset="GBK">
<title>Insert title here</title>
</head>
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
					<table width="724" height="25" border="0" cellpadding="0"
						cellspacing="0"
						background="<%=request.getContextPath()%>/systemImages/bg_02.jpg">
						<tr>
							<td>
								<div align="center">
									<strong>�û�&nbsp;&nbsp;<%=session.getAttribute("name").toString()%>&nbsp;&nbsp;�����ж�����Ϣ</strong>
								</div>
							</td>
						</tr>
					</table>
					<br>
					<table width="96%" border="1" cellpadding="1" cellspacing="1"
						bordercolor="#FFFFFF" bgcolor="CCCCCC">

						<tr bgcolor="#DCDCDC">
							<td width="12%" height="25">
								<div align="center">
									���
								</div>
							</td>
							<td width="12%">
								<div align="center">
									�� ��
								</div>
							</td>
							<td width="36%">
								<div align="center">
									�� ַ
								</div>
							</td>
							<td width="16%">
								<div align="center">
									�Ƿ����
								</div>
							</td>
							<td width="12%">
								<div align="center">
									����ʱ��
								</div>
							</td>
							<td width="12%">
								<div align="center">
									����
								</div>
							</td>
						</tr>
						<%
							for (int i = start; i < over; i++) {
								OrderEntity form = (OrderEntity) list.get(i);
						%>
						<tr align="center" bgcolor="#FFFFFF">
							<td height="25"><%=form.getOrderId()%></td>
							<td><%=form.getMobile()%></td>
							<td><%=form.getAddress()%></td>
							<td>
								<%
									if (Boolean.valueOf(form.getDeliverySign())) {
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
							<td><%=form.getCreateTime()%></td>
							<td>
								<%-- //����鿴��ѯ��ǰ�û�ĳһָ��������ϸ���ϵ����� (�����servlet/javabean/jsp)--%>
								<a
									href="OrderServlet?orderAction=orderDetail&orderId=<%=form.getOrderId()%>">��ϸ��Ϣ</a>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<br/>

					<div align="right">	<a href="javascript:history.go(-1)">����</a>	</div>
					
					<%//ҳ�Ŵ���1ҳ������ʾ����ҳָʾ��
						if (maxPage>1){				
					%>
					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr align="center">
							<td width="17%">
								��Ϊ<%=maxPage%>ҳ
							</td>
							<td width="22%">
								����<%=pageNumber%>����¼
							</td>
							<td width="26%">
								��ǰΪ��<%=number + 1%>ҳ
							</td>
							<td width="19%">
								<%
									if ((number + 1) == 1) {
								%>
								��һҳ<%
									} else {
								%><a
									href="OrderServlet?orderAction=orderListDelivery.jsp&i=<%=number - 1%>">��һҳ</a>
							</td>
							<%
								}
							%>
							<td width="16%">
								<%
									if (maxPage <= (number + 1)) {
								%>��һҳ<%
									} else {
								%><a
									href="OrderServlet?orderAction=orderListDelivery.jsp&i=<%=number + 1%>">��һҳ</a>
							</td>
							<%
								}
							%>
						</tr>
					</table>
					<%
						} 
					%>
				</td>
			</tr>

			<tr>
				<td colspan="2"><jsp:include
						page="../common/statusBarNavigation.jsp" flush="true" />
				</td>
			</tr>

		</table>
</body>
</html>