<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>value3</title>
</head>
<body>
	<h1>
		value01에서 값을 받아서 100로 불리기
		<form action="value1000.jsp" method="post">
            <%
                String a3 = request.getParameter("num10");
                String ap = request.getParameter("alpha");
                int a = 0;
                int b = 0;

                if (a3 != null && !a3.isEmpty()) {
                    try {
                        a = Integer.parseInt(a3);
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
                    int twice = a * 100;
                    int twice2 = b * 100;
            %>
                    <h1>value01의 100배 : <%= twice %></h1>
                    <h1><%=b%>의 100배 : <%= twice2 %></h1>
                    <input type="hidden" value="<%=a%>" name="num100">
                    <input type="hidden" value="<%=twice2%>" name="alpha100">
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