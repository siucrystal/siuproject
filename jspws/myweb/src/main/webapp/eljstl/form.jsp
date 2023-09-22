<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>
<h1>
	<form action="viewParameter.jsp" method="post">
		이름: <input type="text" name="name" size="10"><br>
		주소: <input type="text" name="address" size="30"><br>
		좋아하는 동물: 
		<input type="checkbox" name="pet" value="강아지">강아지
		<input type="checkbox" name="pet" value="고양이">고양이
		<input type="checkbox" name="pet" value="돼지">돼지
		<br>
		<input type="submit" value="전송">
	</form>
</h1>
</body>
</html>