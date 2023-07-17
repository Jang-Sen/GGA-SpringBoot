<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.gga.vo.OrderVo, com.gga.dao.OrderDao" %>
<jsp:useBean id="orderVo" class="com.gga.vo.OrderVo"></jsp:useBean>
<jsp:setProperty property="*" name="orderVo"/>
<%
	OrderDao orderDao = new OrderDao();
	int result = orderDao.insert(orderVo);
	String oid = orderVo.getOid();
	if(result ==1){
		//alert 창을 띄우려면 
		out.write("<script>");
		out.write("location.href ='http://localhost:9000/order/seat?oid="+oid+"'");
		out.write("</script>");
		//response.sendRedirect("http://localhost:9000/mycgv_jsp/login/login.jsp?jresult=1");
	}
%>
    

