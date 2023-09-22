<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String grade = request.getParameter("grade");
%>
<%
	if(grade.equals("1")) {%>
		<jsp:forward page="normal.jsp" />		
	<%}else{%>
		<jsp:forward page="vip.jsp" />
	<% } %>