<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	MemberDTO dto = new MemberDTO(id, pw, name, age);
	
	MemberDAO dao = new MemberDAO();
	int rs = dao.update(dto);
%>
<script>
<% if (rs == 1) { 
	session.setAttribute("name", name); %>
	alert('회원정보가 수정되었습니다.');
	location.href = 'update.jsp';
<% } else { %>
	alert('죄송합니다. 잠시 후에 다시 해주세요.');
	history.back();
<% } %>
</script>