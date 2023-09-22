<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5칙연산 하나로 합치기</title>
</head>
<body>
<%
	String a1 = request.getParameter("a");
	String b1 = request.getParameter("b");
	String sel = request.getParameter("sel");
%>
<jsp:useBean id="dto" class="hellojsp.CalDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="cs" class="hellojsp.CalService"></jsp:useBean>
<% cs.cal(dto); %>


<form action="<%=request.getContextPath() %>/cal.jsp" method="post">
	<input type="text" name="a">
	<select name="sel">
		<option value="+">+</option>
		<option value="-">-</option>
		<option value="*">*</option>
		<option value="/">/</option>
		<option value="%">%</option>		
	</select> 
	<input type="text" name="b">
	<input type="submit" value="계산하기">	
</form>
	Result : <%=dto.getA() %> <%=dto.getSel() %> <%=dto.getB() %> = <%=dto.getResult() %>
</body>
</html>