<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");

	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.getMember(dto);
%>
<script>
function updateJson(id,pw,name,age){
    $.ajax({
      contentType: 'application/json',
      type: 'GET',
      url: 'updateProc.jsp',
      dataType: 'json',
      data: {id: id, pw: pw, name: name, age: age},
      success: function(data) {
   	  	console.log("data : " + data);
       	console.log("확인 되니??");
       	
       	if(data['rs'] === 1) {
       		alert("정보가 수정되었습니다~");
       	}else alert("죄송합니다.. 몇분 후 다시 시도해 주세요ㅠ");
      },
      error: function(xhr, status, error) {
        console.log(xhr, status, error);
      }
    });
}

$(function() {
	$('#updateBtn').click(function(){
		var id = '<%= id %>';
        var pw = $('#pw').val();
        var name = $('#name').val();
        var age = $('#age').val();
        updateJson(id, pw, name, age);
	})
});

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원정보 수정</h2>
<hr>
<form action="updateProc" method="GET">
	<table border="1">
		<tr><th>ID</th><td><%=dto.getId() %></td></tr>
		<tr><th>PW</th><td><input type="text" name="pw" value="<%=dto.getPw()%>" id="pw"></td></tr>
		<tr><th>Name</th><td><input type="text" name="name" value="<%=dto.getName()%>" id="name"></td></tr>
		<tr><th>Age</th><td><input type="text" name="age" value="<%=dto.getAge()%>" id="age"></td></tr>
		<tr><td colspan="2"><input type="button" value="수정하기" id="updateBtn"></td></tr>
	</table>
</form>
</body>
</html>