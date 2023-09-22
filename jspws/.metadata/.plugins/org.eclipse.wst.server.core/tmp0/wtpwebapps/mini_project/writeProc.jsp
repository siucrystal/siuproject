<%@page import="com.google.gson.JsonObject"%>
<%@page import="mini_project.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
			
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto = service.login(dto);

JsonObject jsonObject = new JsonObject();

if (dto != null) {
	if (id.equals(dto.getId())) {
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("nickname", dto.getNickname());
		session.setAttribute("grade", dto.getGrade());
		jsonObject.addProperty("rs", 1);
	}
	else jsonObject.addProperty("rs", 0);
	response.getWriter().write(jsonObject.toString());
}
 %>