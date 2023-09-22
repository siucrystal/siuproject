<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원목록</h2>
<hr>
<table border="1">
<tr>
	<th>Idx</th>
	<th>ID</th>
	<th>PW</th>
	<th>Name</th>
	<th>Age</th>
	<th>Regdate</th>
</tr>

<c:forEach var="dto" items="${list}">
	<tr style="text-align: center;">
		<td>${dto.idx}</td>
		<td>${dto.id}</td>
		<td>${dto.pw}</td>
		<td>${dto.name}</td>
		<td>${dto.age}</td>
		<td>${dto.regdate}</td>
	</tr>
</c:forEach>

</table>
</body>
</html>