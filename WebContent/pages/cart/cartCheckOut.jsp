<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.util.*"%>
<%@ page import="cn.estore.entity.CustomerEntity"%>
<%--����StringUitl�����ֶ����ɶ������ --%>
<%@ page import="cn.estore.util.StringUitl" %>
<%
	java.util.Date date = new java.util.Date();
	CustomerEntity user = (CustomerEntity) session.getAttribute("user");
	String orderId=StringUitl.createOrderId();
	//��orderId����session,��Ϊ������ź�cartToOrder.jsp���浽������Ͷ�����ϸ����
	session.setAttribute("orderId",orderId);
%>
<meta charset="GBK">
<title>Insert title here</title>
</head>

<script language="javascript">
		function checkEmpty(form) {
		for (i = 0; i < form.length; i++) {
			if (form.elements[i].value == "") {
				alert("����Ϣ����Ϊ��");
				return false;
			}
		}
	}

<body>
/* <jsp:include page="../common/head.jsp" flush="true" /> */
	<table width="1024" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
		
			<td width="300" bgcolor="#F5F5F5">
				/* <jsp:include page="../common/left.jsp" flush="true" /> */
			</td>
			
			<td width="724" valign="top" bgcolor="#FFFFFF" align="center">

				<br>
				<br>
				<strong>��������</strong>
				<form name="form" method="post" action="cartToOrder.jsp"
					onSubmit="checkEmpty(form)">
					<table width="68%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" colspan="2">
								<div align="center" class="style1">
									ע�⣺������Ҫ�����ύ�������˶�����͹���Ա��ϵ��
								</div>
							</td>
						</tr>
						<tr>
							<td height="30">
								<div align="center">
									������ţ�
								</div>
							</td>
							<td>
								&nbsp;
								<input type="hidden" name="order_id" value="<%=orderId%>"><%=orderId%>
							</td>
						</tr>
						<tr>
							<td width="24%" height="30">
								<div align="center">
									�û��ʺţ�
								</div>
							</td>
							<td width="76%">
								&nbsp;
								<input type="text" name="name" value="<%=user.getUserName()%>">
							</td>
						</tr>
						<tr>
							<td height="30">
								<div align="center">
									��ʵ������
								</div>
							</td>
							<td>
								&nbsp;
								<input type="text" name="realName"
									value="<%=user.getRealName()%>">
							</td>
						</tr>
						<tr>
							<td height="30">
								<div align="center">
									�ʼĵ�ַ��
								</div>
							</td>
							<td>
								&nbsp;
								<input type="text" name="address" >
							</td>
						</tr>
						<tr>
							<td height="30">
								<div align="center">
									��ϵ�绰��
								</div>
							</td>
							<td>
								&nbsp;
								<input type="text" name="mobile" value="<%=user.getMobile()%>">
							</td>
						</tr>
						
						<tr>
							<td height="30">
								<div align="center">
									Ӧ����
								</div>
							</td>
							<td>
								&nbsp;
								<input type="text" name="totalPrice" value=<%=session.getAttribute("totalPrice") %>>
							</td>
						</tr>
						<tr>
							<td height="30">
								<div align="center">
									���ʽ��
								</div>
							</td>
							<td>
								&nbsp;
								<select name="paymentMode" class="textarea">
									<option value="">
										��ѡ��
									</option>
									<option value="���и���" >
										���и���
									</option>
									<option value="��������">
										��������
									</option>
									<option value="�ֽ�֧��" selected="selected">
										�ֽ�֧��
									</option>
								</select>
							</td>
						</tr>

						<tr>
							<td height="30">
								<div align="center">
									�ͻ���ʽ��
								</div>
							</td>
							<td>
								&nbsp;
								<select name="deliveryMethod" class="textarea">
									<option value="">
										��ѡ��
									</option>
									<option value="��ͨ�ʼ�" selected="selected">
										��ͨ�ʼ�
									</option>
									<option value="�ؿ�ר��">
										�ؿ�ר��
									</option>
									<option value="EMSר�ݷ�ʽ">
										EMSר�ݷ�ʽ
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td height="60">
								<div align="center">
									��ע��Ϣ��
								</div>
							</td>
							<td>
								&nbsp;
								<textarea name="memo"></textarea>
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" name="Submit2" value="�ύ">
					&nbsp;
					<input type="reset" name="reset" value="���">
					&nbsp;
					<input type="button" name="back" value="����"
						onClick="javasrcipt:history.go(-1)">
				</form>
			</td>
		</tr>
	</table>
	/* <jsp:include page="../common/statusBarNavigation.jsp" flush="true" /> */
	
	
</body>
</html>