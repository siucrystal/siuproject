<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>value4</title>
</head>
<body>
	<h1>
		value01에서 값을 받아서 1000로 불리기
		<form action="value01.jsp" method="post">
            <%
                String a4 = request.getParameter("num100");
	            String ap = request.getParameter("alpha100");
	            int a = 0;
	            int b = 0;
	
	            if (a4 != null && !a4.isEmpty()) {
	                try {
	                    a = Integer.parseInt(a4);
	                } catch (NumberFormatException e) {
	                    e.printStackTrace(); 
	                }
	            }
	            if (ap != null && !ap.isEmpty()) {
	                try {
	                    b = Integer.parseInt(ap);
	                } catch (NumberFormatException e) {
	                    e.printStackTrace(); 
	                }
	            }


                if (!(a == 0) || !(b == 0)) {
                    int twice = a * 1000;
                    int twice2 = b * 1000;
            %>
                    <h1>value01의 1000배 : <%= twice %></h1>
                    <h1><%=b%>의 1000배 : <%= twice2 %></h1>
                    <input type="hidden" value="<%=a%>" name="num1000">
                    <input type="submit" value="전송3">
            <%
                } else {
                    out.print("시바 망했네");
                }
            %>
        </form>
	</h1>
</body>
</html>