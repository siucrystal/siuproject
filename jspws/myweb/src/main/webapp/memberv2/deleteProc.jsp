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
	int rs = 0;
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.getMember(dto);
	
	if (dto.getPw().equals(pw)) rs = dao.delete(dto);
%>
<script>
<% if (rs == 1) { 
	session.invalidate(); %>
	alert('회원탈퇴가 되었습니다. 그동안 감사했습니다.');
	location.href = 'index.jsp';
<% } else { %>
	alert('죄송합니다. 잠시 후에 다시 해주세요.');
	history.back();
<% } %>
</script>