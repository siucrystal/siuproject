<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원가입</h2>
<hr>
<form action="joinProc.jsp" method="post">
	<table border="1">
		<tr><th>ID</th><td><input type="text" name="id"></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw"></td></tr>
		<tr><th>PW2</th><td><input type="text" name="pw2"></td></tr>
		<tr><th>Name</th><td><input type="text" name="name"></td></tr>
		<tr><th>Age</th><td><input type="text" name="age"></td></tr>
		<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
	</table>
</form>
</body>
</html>