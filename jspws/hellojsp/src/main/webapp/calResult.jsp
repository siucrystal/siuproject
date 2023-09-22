<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calResult.jsp</title>
</head>
<body>
	<h1>
		<form action="calForm.jsp" method=get>
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
                    %><h1>Result : <%=a %> + <%=b %> = <%=plus %></h1>
                    	<input type="submit" value="다시하기"><%
               		} else  if(sel.equals("-")) {
                    	int minus = a - b;
                    	%><h1>Result : <%=a %> - <%=b %> = <%=minus %></h1>
                    	<input type="submit" value="다시하기"><%
               		} else  if(sel.equals("*")) {
                    	int mul = a * b;
                    	%><h1>Result : <%=a %> * <%=b %> = <%=mul %></h1>
                    	<input type="submit" value="다시하기"><%
               		} else  if(sel.equals("/")) {
                    	int div = a / b;
                    	%><h1>Result : <%=a %> / <%=b %> = <%=div %></h1>
                    	<input type="submit" value="다시하기"><%
               		} else  if(sel.equals("%")) {
                    	int quo = a % b;
                    	%><h1>Result : <%=a %> % <%=b %> = <%=quo %></h1>
                    	<input type="submit" value="다시하기"><%
               		} else {
               			out.print("요게 아니얌?..ㅠ");
               		}
                    
                } else {
                    out.print("시바 망했네");
                }
            %>
        </form>
	</h1>
</body>
</html>