<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.getMemberList();
%>
<%
JsonArray jsonArray = new JsonArray();
for(MemberDTO dto: list){
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("id", dto.getId());
	jsonObject.addProperty("pw", dto.getPw());	
	jsonArray.add(jsonObject);
}

out.print(jsonArray.toString());
%>
