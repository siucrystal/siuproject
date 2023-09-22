<%@page import="com.google.gson.JsonObject"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	MemberDTO dto = new MemberDTO(id, pw, name, age);
	MemberDAO dao = new MemberDAO(); 
	int rs = dao.insert(dto);
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("rs", rs);
	System.out.println("rs : " + rs);
%>
<%=jsonObject%>