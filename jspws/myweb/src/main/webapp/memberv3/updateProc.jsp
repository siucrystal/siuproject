<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
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
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));

%>

<%
		String id = (String)session.getAttribute("id");

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setAge(age);
		
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.getMemberList();
		int rs = dao.update(dto);
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("rs", rs);
	
%>
<%=jsonObject%>



