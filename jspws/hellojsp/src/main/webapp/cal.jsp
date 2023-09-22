<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5칙연산 하나로 합치기</title>
</head>
<body>
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
	
	
	<%
		String a1 = request.getParameter("num1");
	    String b1 = request.getParameter("num2");
	    String sel = request.getParameter("sel");
	    int a = 0;
	    int b = 0;
	
	    if (a1 != null && !a1.isEmpty()) {
	        try {
	            a = Integer.parseInt(a1);
	        } catch (NumberFormatException e) {
	            e.printStackTrace(); 
	        }
	    }
	    if (b1 != null && !b1.isEmpty()) {
	        try {
	            b = Integer.parseInt(b1);
	        } catch (NumberFormatException e) {
	            e.printStackTrace(); 
	        }
	    }
	
	    if (!(a == 0) || !(b == 0)) {
	    	int result = 0;
	    	
	        if(sel.equals("+")) {
	        	int plus = a + b;
	        %><hr><h1>Result : <%=a %> + <%=b %> = <%=plus %></h1><%
	   		} else  if(sel.equals("-")) {
	        	int minus = a - b;
	        	%><hr><h1>Result : <%=a %> - <%=b %> = <%=minus %></h1><%
	   		} else  if(sel.equals("*")) {
	        	int mul = a * b;
	        	%><hr><h1>Result : <%=a %> * <%=b %> = <%=mul %></h1><%
	   		} else  if(sel.equals("/")) {
	        	int div = a / b;
	        	%><hr><h1>Result : <%=a %> / <%=b %> = <%=div %></h1><%
	   		} else  if(sel.equals("%")) {
	        	int quo = a % b;
	        	%><hr><h1>Result : <%=a %> % <%=b %> = <%=quo %></h1><%
	   		} else {
	   			out.print("요게 아니얌?..ㅠ");
	   		}
	        
	    } else {
	        out.print(" ");
	    }
    %>
</body>
</html>