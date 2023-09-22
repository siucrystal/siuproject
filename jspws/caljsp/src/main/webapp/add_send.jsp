<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// add_send.jsp
	String sA = "10";
	String sB = "20";
	
	String param = String.format("num1=%s%num2=%s&sel=", sA, sB);
	String path = "add.jsp?" + param + URLEncoder.encode("+");
	// response.sendRedirect(path);
%>
<script>
	// alert("진짜 이동할껴?");
	location.href = '<%=path%>';
</script>