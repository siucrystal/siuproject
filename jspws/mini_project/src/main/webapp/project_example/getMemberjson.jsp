<%@page import="mini_project.MemberDAOImpl"%>
<%@page import="mini_project.MemberDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="mini_project.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	MemberDAO dao = new MemberDAOImpl();
	dto = dao.getMember(dto);
	String rs = "0"; 
	if(dto != null) {
		rs = "1";
	}
	
	// response.sendRedirect("idcheck.jsp?rs=" + rs);
	
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("rs", rs);
%>
<%=jsonObject%>