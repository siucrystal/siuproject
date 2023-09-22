<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>스크립트릿 방식</h1>
<h3>
<%String name = (String)request.getAttribute("name");%>
<%=name %>

<%MemberDTO m = (MemberDTO)request.getAttribute("member");%>
<%if(m !=null){ %>
<%=m.getId() %>,<%=m.getPw() %>,<%=m.getName() %>,<%=m.getAge() %><br>
<%} %>
</h3>
<h3>
<%String[] nameArray = (String[])request.getAttribute("nameArray");%>
<%for(String n : nameArray) {%>
<%=n %>
<%} %>

</h3>
<br>
<br><hr>
<h1>EL + JSTO 방식</h1>
<h3>
<%List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("list");%>
<%for(MemberDTO dto : list) {%>
<%=dto.getId() %>,<%=dto.getPw() %>,<%=dto.getName() %>,<%=dto.getAge() %><br>
<%} %>

</h3>
<br><hr>
<h1>EL + JSTO 방식</h1>
<h3>
${requestScope.name}

</h3>
<br>
<h3>
<c:forEach var="n" items="${requestScope.nameArray}">${n}</c:forEach>
</h3>
<br>
<h3>
<c:forEach var="dto" items="${list}">
${dto.id} / ${dto.pw} / ${dto.name} / ${dto.age} <br>
</c:forEach>
</h3>


<c:if test="${member != null}">
<h2>${member.id} / ${member.pw} / ${member.name} / ${member.age}</h2>
</c:if>
</body>
</html>