<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calform.jsp</title>
</head>
<body>
<h1>5칙연산 계산기
<form action="calResult.jsp" method="get">
	<input type="text" name="num1">
	<select name="sel">
		<option value="+">+</option>
		<option value="-">-</option>
		<option value="*">*</option>
		<option value="/">/</option>
		<option value="%">%</option>		
	</select> 
	<input type="text" name="num2">
	<input type="submit" value="계산하기">	
</form>
</h1>
</body>
</html>