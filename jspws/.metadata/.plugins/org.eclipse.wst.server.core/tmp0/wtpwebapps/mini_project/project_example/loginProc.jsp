<%@page import="mini_project.MemberDAOImpl"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="mini_project.MemberDAO"%>
<%@page import="mini_project.MemberDTO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");  // 이건 한글로 변형 시켜주는 거(이거 없으면 한글 깨짐)
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw"); 
%>

<%
		
		boolean isId = false;
		boolean isPw = false;
		String name = "";
		String grade = "";
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		MemberDAO dao = new MemberDAOImpl();
		dto = dao.getMember(dto);
		String rs = "0"; 
		if(dto != null) {
			isId = true;
			pw = dto.getPw();
			name = dto.getNickname();
			grade = dto.getGrade();
			rs = "0";
			if(dto.getPw().equals(pw)) {
				isPw = true;
				System.out.print("dto.getPw : " + dto.getPw());
				rs = "1";
			} else rs = "0";
		}	

	if(isId && isPw) {
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", name);
		session.setAttribute("grade", grade);
	} 

	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("rs", 1);
%>
<%=jsonObject%>



