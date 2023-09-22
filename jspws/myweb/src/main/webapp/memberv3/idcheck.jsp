<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function getMemberAjax(id) {
		$.ajax({
			contentType : 'application/json',
			type: 'GET',
			url: 'getMemberjson.jsp',
			data: {id:id},
			dataType: 'json',
			success: function(response) {
				console.log(response); // {rs: '1'}
				if(response['rs'] === '0') {
					$('#use').show();
					$('#notuse').hide();
				}else{
					$('#notuse').show();
					$('#use').hide();
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	}
	
	$(function name(){
		$('#notuse, #use').hide();
		$('#checkBtn').on('click',function(){
			getMemberAjax($('#id').val());			
		});
	})
</script>
<meta charset="UTF-8">
<title>test idcheck</title>
</head>
<body>
<h1>
	<form name="joinForm" action="getMemberjson.jsp" method="post">
		<table border="1">
			<tr><th>ID</th>
			<td><input type="text" name="id" id="id">
			<input type="button" value="check ID" id="checkBtn">
			</td></tr>	
			<tr id="notuse"><td colspan="2">존재하는 ID 입니다</td></tr>
			<tr id="use"><td colspan="2">사용가능한 ID 입니다</td></tr>
			<tr><td colspan="2"><input type="submit" value="회원가입"></td></tr>
		</table>
	</form>
</h1>
</body>
</html>