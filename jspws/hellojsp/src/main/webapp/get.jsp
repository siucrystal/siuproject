<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int ia = 0;
int ib = 0;
	if(!(request.getParameter("a") == null || request.getParameter("b") == null)) {
		String a = request.getParameter("a");		
		String b = request.getParameter("b");
		ia = Integer.parseInt(a);
		ib = Integer.parseInt(b);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta char+-set="UTF-8">
<title>get.jsp(보내는아이)</title>
</head>
<body>
	<h1>보내는 페이지 or 요청(Request) 페이지
		<a href="a.jsp?a=2&b=10">A가 B에게 요청</a>
	</h1>
</body>
</html>