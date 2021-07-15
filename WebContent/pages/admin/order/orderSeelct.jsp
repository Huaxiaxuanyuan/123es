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
int start=number*6;//开始条数
int over=(number+1)*6;//结束条数
int count=pageNumber-over;//还剩多少条记录
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
            <td><div align="center"><strong>订单是否发货查询</strong></div></td>
          </tr>
        </table>
        <br>
		  <table width="90%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
        <tr>
          <td width="14%" height="25"><div align="center">数据编号</div></td>
          <td width="19%"><div align="center">电话</div></td>
          <td width="14%"><div align="center">地址</div></td>
          <td width="14%"><div align="center">是否出库</div></td>
          <td width="14%"><div align="center">订货时间</div></td>
          <td width="25%"><div align="center">操作</div></td>
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
          	%>否<%
          	}else{
          	%>是<%
          	}%></div></td> 
          <td><div align="center"><%=form.getCreateTime()%></a></div></td>
          <td><div align="center"><a href="<%=path %>/order/orderInfoById.action?id=<%=form.getOrderId()%>">详细信息</a>&nbsp;&nbsp;
		  </div></td>
          <%}%>  </tr>
      </table>
	  <br>
	  <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
          <td width="13%">共为<%=maxPage%>页</td>
          <td width="16%">共有<%=pageNumber%>条记录</td>
          <td width="14%">当前为第<%=number+1%>页</td>
          <td width="19%"><%if((number+1)==1){%>  
	  上一页  
        <%}else{%>
		<a href="<%=path %>/order/listByDelivery?i=<%=number-1%>">
		  上一页</a></td>
          <%}%>
          <td width="18%"><%if(maxPage<=(number+1)){%>
            下一页
              <%}else{%>
		<a href="<%=path %>/order/listByDelivery?i=<%=number+1%>">下一页</a>
<%}%>
           </tr>
      </table>
    </td>
  </tr>
</table>
<%-- <jsp:include page="../statusBarNavigation.jsp" flush="true" /> --%>
</body>
</html>