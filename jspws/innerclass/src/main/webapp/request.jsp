<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
	<h1>클라이언트 및 서버 정보</h1>
	<h2>
		클라이언트 IP : <%=request.getRemoteAddr() %><br>
		요청프로토콜 : <%=request.getProtocol() %><br>
		요청 Method : <%=request.getMethod() %><br>
		URI : <%=request.getRequestURI() %> <br>
		컨텍스트 root 명 : <%=request.getContextPath() %>/request.jsp<br>
		서버이름 : <%=request.getServerName() %><br>
		서버포트 : <%=request.getServerPort() %><br>
	</h2>
</body>
</html>