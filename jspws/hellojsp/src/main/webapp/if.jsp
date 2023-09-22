<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if</title>
</head>
<body>
	<h1>if 문</h1>
	<%
		String role = "admin";
		if(role.equals("admin")) {
			out.print("<img src='./img/ect/one_3.jpg' alt='원피스'>");	
		}else {
			out.print("GUEST <br>");
		}
	%>
	<hr>
	<%role = "guest";
		if(role.equals("admin")) {
	%>
			<img src='./img/ect/one_2.jpg' alt='원피스'>
	<%}else {%>
			<img src='./img/ect/one_1.gif' alt='원피스'>
	<%}%>
	<hr>
</body>
</html>