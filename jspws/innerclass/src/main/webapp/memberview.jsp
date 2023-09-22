<%@page import="innerclass.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	int age2 = 0;
	
	// 이걸로 age를 숫자로 변형
	if (age != null && !age.isEmpty()) {
        try {
            age2 = Integer.parseInt(age);
        } catch (NumberFormatException e) {
            e.printStackTrace(); 
        }
    }
	// MemberDTO 객체 생성
	MemberDTO memberDTO = new MemberDTO(id, pw, name, age2);
	
	// ID가 이미 존재하는지 확인
    boolean idCheck = false; // ID가 존재하면 true, 아니면 false로 설정
%>
<!-- <jsp:useBean id="dto" class="innerclass.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="cs" class="innerclass.MemberDTO"></jsp:useBean> -->
<% // cs.memberview(dto); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료 페이지</title>
</head>
<body>
	<form action="memberform.jsp" method="get">
		<% if(idCheck) { %>
			<h3>해당 ID <%=id %>는 회원가입되어있습니다</h3>
			<input type="submit" value="회원 가입 다시하기">
		<%} else { %>
			<h2><%=id %>님의 회원가입을 축하합니다~ </h2>
			<table border="1" cellpadding="10">
				<tr> <td>Id</td><td>Pw</td><td>Name</td><td>Age</td> </tr>
				<tr> <td><%=id %></td><td><%=pw %></td><td><%=name %></td><td><%=age %></td> </tr>
			</table>
		<%} %>
	</form>
</body>
</html>