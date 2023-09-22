<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// total_num.jsp
Object oVisit = application.getAttribute("visit");

int iVisit = 0;
if(oVisit != null){
	iVisit = (int)oVisit;
}
iVisit += 1;
application.setAttribute("visit", iVisit);
%>