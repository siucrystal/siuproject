<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
int login = (int)application.getAttribute("login");
login--;
application.setAttribute("login", login);

response.sendRedirect("index_2.jsp");
%>