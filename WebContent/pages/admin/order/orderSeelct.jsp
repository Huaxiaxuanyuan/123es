<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<%@page import="cn.estore.entity.OrderEntity"%>
<%@page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	List list=(List)request.getAttribute("list");
int number=Integer.parseInt((String)request.getAttribute("number"));
int maxPage=Integer.parseInt((String)request.getAttribute("maxPage"));
int pageNumber=Integer.parseInt((String)request.getAttribute("pageNumber"));
int start=number*6;//��ʼ����
int over=(number+1)*6;//��������
int count=pageNumber-over;//��ʣ��������¼
if(count<=0){
  over=pageNumber;
  }
%> 
<html>
<head>
<base href="<%=basePath%>">
<meta charset="GBK">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:include page="../top.jsp" flush="true"/> --%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <%--  <td width="300"  valign="top"><jsp:include page="../left.jsp" flush="true" /></td> --%>
    <td width="724" align="center" valign="top" bgcolor="#FFFFFF"> <br>
	
        <table width="723" height="25" border="0" cellpadding="0" cellspacing="0" background="<%=path %>/image/bg_02.jpg">
          <tr>
            <td><div align="center"><strong>�����Ƿ񷢻���ѯ</strong></div></td>
          </tr>
        </table>
        <br>
		  <table width="90%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
        <tr>
          <td width="14%" height="25"><div align="center">���ݱ��</div></td>
          <td width="19%"><div align="center">�绰</div></td>
          <td width="14%"><div align="center">��ַ</div></td>
          <td width="14%"><div align="center">�Ƿ����</div></td>
          <td width="14%"><div align="center">����ʱ��</div></td>
          <td width="25%"><div align="center">����</div></td>
        </tr>
		     <%
		     	for(int i=start;i<over;i++){
		                 OrderEntity form=(OrderEntity)list.get(i);
		     %>
        <tr bgcolor="#FFFFFF">
          <td height="30"><div align="center"><%=form.getOrderId()%></div></td>
          <td><div align="center"><%=form.getMobile()%></div></td>
          <td><div align="center"><%=form.getAddress()%></a></div></td>         
          <td><div align="center">
          <%if(form.getDeliverySign() == false){
          	%>��<%
          	}else{
          	%>��<%
          	}%></div></td> 
          <td><div align="center"><%=form.getCreateTime()%></a></div></td>
          <td><div align="center"><a href="<%=path %>/order/orderInfoById.action?id=<%=form.getOrderId()%>">��ϸ��Ϣ</a>&nbsp;&nbsp;
		  </div></td>
          <%}%>  </tr>
      </table>
	  <br>
	  <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
          <td width="13%">��Ϊ<%=maxPage%>ҳ</td>
          <td width="16%">����<%=pageNumber%>����¼</td>
          <td width="14%">��ǰΪ��<%=number+1%>ҳ</td>
          <td width="19%"><%if((number+1)==1){%>  
	  ��һҳ  
        <%}else{%>
		<a href="<%=path %>/order/listByDelivery?i=<%=number-1%>">
		  ��һҳ</a></td>
          <%}%>
          <td width="18%"><%if(maxPage<=(number+1)){%>
            ��һҳ
              <%}else{%>
		<a href="<%=path %>/order/listByDelivery?i=<%=number+1%>">��һҳ</a>
<%}%>
           </tr>
      </table>
    </td>
  </tr>
</table>
<%-- <jsp:include page="../statusBarNavigation.jsp" flush="true" /> --%>
</body>
</html>