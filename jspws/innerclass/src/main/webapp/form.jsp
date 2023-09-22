<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>
	<h2>
		<form action="viewparam.jsp" method="post ">
			Name: <input type="text" name="name" size="10" maxlength="10"><br>
			Address: <input type="text" name="address" size="30"><br>
			좋아하는 동물 : 
			<input type="checkbox" name="pet" value="강아지">강아지
			<input type="checkbox" name="pet" value="고양이">고양이
			<input type="checkbox" name="pet" value="기니피그">기니피그 <br>
			<input type="submit" value="Submit">		
		</form>
	</h2>
</body>
</html>