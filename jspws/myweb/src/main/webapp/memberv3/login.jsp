<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function getMemberAjax(id) {
		$.ajax({
			contentType : 'application/json',
			type: 'GET',
			url: 'loginProc.jsp',
			data: {id},
			dataType: 'json',
			success: function(data) {
				console.log("data : " +data); // {rs: '1'}
				console.log("data List : " + data['rs'])
				if(data['rs'] === '1') {	
					alert(data['rs'])
					alert("환영합니다~");
					location.href = "index.jsp";
				}else{
					alert("아이디나 비밀번호를 확인해주세요");
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	$(function (){
		$('#loginBtn').on('click',function(){
			getMemberAjax($('#id').val());			
		});
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<%-- <%	if(request.getAttribute("rs") != null){ %>
<script>
	alert('회원가입 축하드립니다.!!');
</script>
<%} %> --%>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>로그인</h2>
<hr>
<form action="loginProc" method="GET">
	<table border="1">
		<tr><th>ID</th><td><input type="text" name="id" id="id"></td></tr>
		<tr><th>PW</th><td><input type="password" name="pw"></td></tr>
		<tr><td colspan="2"><input type="button" value="로그인" id="loginBtn"></td></tr>
	</table>
</form>
</body>
</html>