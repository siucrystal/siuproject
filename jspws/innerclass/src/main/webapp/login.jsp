<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

session.setAttribute("id", id);
int login = 0;
if(application.getAttribute("login") != null){
	login = (int)application.getAttribute("login");	
}
login++;
application.setAttribute("login", login);

response.sendRedirect("index_2.jsp");
%>
