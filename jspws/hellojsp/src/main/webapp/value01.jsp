<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<form action="value10.jsp" method="post">
			<input type="text" name="number">
			<input type="submit" value="전송">
		</form>
		
		<%
			String a5 = request.getParameter("num1000");
			int a = 0;
			
			if (a5 != null && !a5.isEmpty()) {
		        try {
		            a = Integer.parseInt(a5);
		        } catch (NumberFormatException e) {
		            e.printStackTrace(); 
		        }
		    }
		
		    if (!(a == 0)) {
		        int twice = a;
		%>
		        <h1>원래값은 <%=a %></h1>
		<%
		    } 
		%>
	</h1>
</body>
</html>