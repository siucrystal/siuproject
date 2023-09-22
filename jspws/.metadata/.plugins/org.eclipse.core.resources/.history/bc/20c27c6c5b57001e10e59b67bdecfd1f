<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.getMemberList();
	String name = request.getParameter("name");
	
	if (name != null && !name.isEmpty()) {
        // 이름이 제공되면 LIKE 연산자를 사용하여 검색
        list = dao.searchMembersByName(name);
    } else {
        // 이름이 제공되지 않으면 모든 회원을 검색
        list = dao.getMemberList();
    }
%>
<%
 JsonArray jsonArray = new JsonArray();
for(MemberDTO dto: list){
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("id", dto.getId());
	jsonObject.addProperty("pw", dto.getPw());	
	jsonObject.addProperty("age", dto.getAge());	
	jsonObject.addProperty("name", dto.getName());	
	jsonObject.addProperty("regdate", dto.getRegdate());	
	jsonArray.add(jsonObject);
} 

out.print(jsonArray.toString());
%>
