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
		String scope = (String)request.getAttribute("scope");
	%>
	<%=scope %>
	<hr>
	
	EL request scope : ${requestScope.scope} <br>
	EL request scope2 : ${scope}
	
</body>
</html>