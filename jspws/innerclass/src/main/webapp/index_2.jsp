<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="total_num.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<h1>Member Service</h1>
<hr>
총 페이지 방문수 : <%=application.getAttribute("visit") %>명 /
현재 접속 중 : <%=application.getAttribute("login") %>명
<hr>
<a href="memberForm.jsp">1.회원가입</a>
<hr>
<%if(session.getAttribute("id") == null) {%>
<form action="login.jsp" method="post">
ID: <input type="text" name="id"> <br>
PW: <input type="text" name="pw"> <br>
<input type="submit" value="Login">
</form>
<%}else{ %>

id : <%=session.getAttribute("id") %> <a href="logout.jsp">Logout</a>
<%} %>
</body>
</html>







