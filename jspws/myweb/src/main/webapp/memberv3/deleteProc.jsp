<%@page import="com.google.gson.JsonObject"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 이건 한글로 변형 시켜주는 거(이거 없으면 한글 깨짐)
	/* String id = (String)session.getAttribute("id"); */
	String id = "test";
	/* String pw = request.getParameter("pw"); */
	String pw = "t_pw";
%>

<%
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	MemberDAO dao = new MemberDAO();
	/* int rs = dao.delete(dto); */
	String as = "0";
	System.out.print("pw dto : " + dto.getPw());
	System.out.print("pw : " + pw);
	if(dto.getPw() != null && dto.getPw().equals(pw)) {
		as = "1";
	}
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("rs", as);
	
%>
<%=jsonObject%>


