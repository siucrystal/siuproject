<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
public int add(int a, int b) {
	int c = a  + b;
	return c;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useMethod</title>
</head>
<body>
	<h1>메소드</h1>
	<%
		int v1 = 3;
		int v2 = 9;
		int result = add(v1,v2);
	%>
	<%=v1 %> + <%=v2 %> = <%=result %>
	<hr>
	
	<%
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = format.format(date);
	%>
	<h1>Today : <%=strDate %></h1>
</body>
</html>