<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for</title>
</head>
<body>
	<h1>1 ~ 10 까지 출력</h1>
	<%
		for(int i=0; i<10; i++) {%>
			n = <%=i+1 %><br>
		<%}
	%>
	
	<h1>1 ~ 10 까지 합 출력</h1>
	<%
	int sum = 0;
		for(int i=0; i<10; i++) {
			sum = (i+1);
		}
	%>
	
	<h2>sum = <%=sum%></h2>
	<hr>
	<%
		for(int i=1; i<7; i++) {%>
			<h<%=i %>>Heading Tag <%=i %> </h<%=i %>>
		<%}
	%>
</body>
</html>