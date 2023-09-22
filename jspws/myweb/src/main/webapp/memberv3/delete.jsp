<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="loginCheck.jsp" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function deleteAjax(pw) {
		$.ajax({
			contentType : 'application/json',
			type: 'GET',
			url: 'deleteProc.jsp',
			data: {pw},
			dataType: 'json',
			success: function(response) {
				console.log(response); // {rs: '1'}
				console.log("rsponse['rs']" + response['rs']);
				console.log("pw : " + pw);
				if(response['rs'] === "1") {
					<%-- <%session.invalidate();%> --%>
					alert('회원 탈퇴 했다.. 잘가라...');
					/* location.href = "index.jsp"; */
				}else{
					alert('그래 탈퇴는 별로지?! 탈퇴 안해도 되~~ ㅎ');
					/* history.back(); */
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	}
	
	$(function (){
		$('#deleteBtn').on('click',function(){
			deleteAjax($('#pw').val());			
		});
	})
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원탈퇴</h2>
<hr>
<form action="deleteProc" method="post">
	<table border="1">
		<tr><th>PW</th><td><input type="password" name="pw" id="pw"></td></tr>
		<tr><td colspan="2"><input type="button" value="회원탈퇴" id="deleteBtn"></td></tr>
	</table>
</form>
</body>
</html>