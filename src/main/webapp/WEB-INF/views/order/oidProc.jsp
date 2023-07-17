<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.gga.dao.OrderDao" %>
<%
	OrderDao orderDao = new OrderDao();
	String oid = orderDao.getOid();
	out.write(oid);
	

%>
