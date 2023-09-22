<%@page import="hellojsp.CalService"%>
<%@page import="hellojsp.CalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a1 = request.getParameter("num1");
    String b1 = request.getParameter("num2");
    String sel = request.getParameter("sel");
    
    CalDTO dto = null;
    CalService cs = new CalService();
    if(a1 != null && b1 != null) {
    	int a = Integer.parseInt(a1);
    	int b = Integer.parseInt(b1);
    	dto = new CalDTO(a, b, 0, sel);
    	dto = cs.cal(dto);
    } else {
    	dto = new CalDTO();	    	
    }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5칙연산 하나로 합치기</title>
</head>
<body>
<%@ include file="cal2.jsp" %>
<form action="cal.jsp" method="get">
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
<hr>
Result : <%=dto.getA() %> <%=dto.getSel() %> <%=dto.getB() %> = <%=dto.getResult() %>
	
	
	
</body>
</html>