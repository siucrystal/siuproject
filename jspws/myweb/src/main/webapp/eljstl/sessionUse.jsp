<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestUse</title>
</head>
<body>
	<%
		String scope = (String)session.getAttribute("scope");
	%>
	<%=scope %>
	<hr>
	
	EL session scope : ${sessionScope.scope} <br>
	EL session scope2 : ${scope}
	
</body>
</html>