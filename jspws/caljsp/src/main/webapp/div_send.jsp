<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="menu_send.jsp" %>
<%
	// add_send.jsp
	String sA = "30";
	String sB = "5";
	
	String param = String.format("num1=%s%num2=%s&sel=", sA, sB);
	String path = "div.jsp?" + param + URLEncoder.encode("+");
	response.sendRedirect(path);
	
	
%>