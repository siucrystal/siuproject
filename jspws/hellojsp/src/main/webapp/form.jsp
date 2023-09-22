<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.js</title>
</head>
<body>
<h1> form에서 post페이지로 전송
	<form action="post.jsp" method="post">
		A : <input type="text" name="lastName">
		B : <input type="text" name="firstName">
		<input type="submit" value="전송">
	</form>
</h1>
</body>
</html>