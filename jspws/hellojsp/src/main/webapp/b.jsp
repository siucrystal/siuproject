<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("aaa");
	String b = request.getParameter("bbb");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
	<h1>B가 A에게 받는 페이지</h1>
	<h2>
		a = <%=a %>, b = <%=b %>
	</h2>
</body>
</html>