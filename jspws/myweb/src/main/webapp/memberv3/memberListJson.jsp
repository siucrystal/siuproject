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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script>
function getJson(param){
    $.ajax({
      contentType: 'application/json',
      type: 'GET',
      url: 'memberListData.jsp',
      dataType: 'json',
      success: function(data) {
        innerHtml(data);
      },
      error: function(xhr, status, error) {
        console.log(xhr, status, error);
      }
    });
}

function innerHtml(data){
	
    let tr = '';    
    var tag = '';
	for(item of data){
		const {idx,id, pw, age, name, regdate} = item;
		tr += '<tr><td>'+idx+'</td><td>'+id+'</td><td>'+pw+'</td><td>'+name+'</td><td>'+age+'</td><td>'+regdate+'</td></tr>';
	    tag += `<tr><td>${id}</td><td>${pw}</td></tr>`;
    }	
	
    $('tbody').html(tr);
}

$(function() {
 getJson();
});
  
</script>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원목록</h2>
<hr>
<table border="1">
<thead>
<tr>
	<th>Idx</th>
	<th>ID</th>
	<th>PW</th>
	<th>Name</th>
	<th>Age</th>
	<th>Regedate</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
</body>
</html>