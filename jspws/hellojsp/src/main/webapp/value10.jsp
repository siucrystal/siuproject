<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>value10</title>
</head>
<body>
	<h1>
		value01에서 값을 받아서 10로 불리기
		<form action="value100.jsp" method="post">
            <%
                String a2 = request.getParameter("number");
                int a = 0;

                if (a2 != null && !a2.isEmpty()) {
                    try {
                        a = Integer.parseInt(a2);
                    } catch (NumberFormatException e) {
                        e.printStackTrace(); 
                    }
                }

                if (!(a == 0)) {
                    int twice = a * 10;
            %>
                    <h1>value01의 10배 : <%= twice %></h1>
                    <input type="hidden" value="<%=a%>" name="num10">
                    <input type="hidden" value="<%=twice%>" name="alpha">
                    <input type="submit" value="전송2">
            <%
                } else {
                    out.print("시바 망했네");
                }
            %>
        </form>
	</h1>
</body>
</html>