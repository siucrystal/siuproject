<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>백작가의 망나니가 되었다</h1>
	<h2>케일 헤니투스</h2>
	<% 
		String name = "cale Henitue";
		String email = "cale@email.com";
		String img = "./img/ect/b_2.jpg";
		String img2 = "./img/ect/one_2.jpg";
		String imgAlt = "케일";
		String img2Alt = "조로";
		
		out.print("name : " + name);
		out.print("<br>");
		out.print("email : " +email);
	%><br>
	<ul>
	<li><%=name %></li><br>
	<li><%=email %></li>
	<li>Cale : <img style="width: 200px" height="150px" src="<%=img %>" alt="<%=imgAlt %>"></li>
	<li>Zoro : <img style="width: 150px" height="150px" src="<%=img2 %>" alt="<%=img2Alt %>"></li>
	</ul>
	
	<table>
		<tr><td><%=name %></td><td><%=email %></td></tr>
	</table>
</body>
</html>