<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sA = request.getParameter("a");
	String sB = request.getParameter("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operator</title>
</head>
<body>
	<h1>연산자</h1>
<%
	int a = Integer.parseInt(sA);
	int b = Integer.parseInt(sB);
%>
	<h2>산술 연산자</h2>
	
	a + b = <%=a+b %><br>
	a - b = <%=a-b %><br>
	a * b = <%=a*b %><br>
	a / b = <%=a/b %><br>
	a % b = <%=a%b %><br>
	
	<h2>비교 연산자</h2>
	a == b = <%=a==b %><br>
	a >= b = <%=a>=b %><br>
	a > b = <%=a>b %><br>
	a < b = <%=a<b %><br>
	a <= b = <%=a<=b %><br>
	a != b = <%=a!=b %><br>
	
	<h2>논리 연산자</h2>
	a == b && a <= b = <%=a==b && a<=b  %><br>
	a == b || a <= b = <%=a==b || a<=b  %><br>
	!(a == b) = <%=!(a==b) %><br>
</body>
</html>