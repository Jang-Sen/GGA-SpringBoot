<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.gga.dao.OrderDao" %>
<%-- <jsp:useBean id="orderVo" class="com.gga.vo.OrderVo"></jsp:useBean>
<jsp:setProperty property="*" name="orderVo"/> --%>
<%
	OrderDao orderDao = new OrderDao();

	String seat = request.getParameter("seat");
	String price = request.getParameter("price");
	String oid = request.getParameter("oid");
	/* orderDao.insert(seat, Integer.parseInt(price), oid); */
/* 	int result = orderDao.insert(seat, price, oid); 
 */	
	/* out.write(String.valueOf(result)); */
%>
