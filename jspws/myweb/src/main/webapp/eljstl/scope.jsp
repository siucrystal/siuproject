<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope</title>
</head>
<body>
	<%
		pageContext.setAttribute("scope", "Page");
		session.setAttribute("scope", "Session_");
		application.setAttribute("scope", "Applicaion");
	%>
	${scope}
</body>
</html>