<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 이건 id 유무체크 -->
<script>
	function getMemberListAjax(id) {
		$.ajax({
			contentType : 'application/json',
			type: 'GET',
			url: 'getMemberjson.json',
			data: {id:id},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				if(data['rs'] === '0') {
					if(!$('#id').val()) {
						alert("id 입력해주세요!!");
						$('#notuse').css({display: 'none'});
						$('#use').css({display: 'none'});
					}else {
						$('#use').css({display: 'table-row'});
						$('#notuse').css({display: 'none'});
						console.log("사용가능");
					}
				}
				else{
					$('#notuse').css({display: 'table-row'});
					$('#use').css({display: 'none'});
					console.log("사용불가");
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	$(function(){
		$('#notuse, #use').css({display: 'none'});
		$('#checkBtn').on('click',function(){
			var id = $('#id').val();
			getMemberListAjax(id);
		});
	});
</script>

<script>
	function ajaxJoin() {
		var id = $('#id').val();
		var pw = $("#pw").val();
	    var pw2 = $("#pw2").val();
	    var name = $('#name').val();
	    var age = $('#age').val();
	    // const params = {id,pw,name,age};
	    const params = {id:id, pw:pw, name:name, age:age};
	    // console.log("params : " +params);

	    // 비밀번호와 비밀번호 확인이 일치하는지 확인
	    console.log("pw : " + pw);
	    console.log("pw2 : " + pw2);
	    if (pw !== pw2) {
	        // 비밀번호가 일치하지 않는 경우
	        alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
	        return;
	    }
		
		$.ajax({
			type: 'POST',
			url: 'joinProcAjax.do',
			dataType: 'json',
			data: params,
			success: function(data) {
				if(data['rs'] === 1) {
					alert('회원가입 되었습니다~');
					location.href = 'login.do';
				} else {
					alert('잠시후 다시 한번 시도해주세요ㅠ');					
				}
				
			},
			error : function(xhr, status, error) {
				console.log(xhr, status, error);
				alert("실패했니?");
			}
		});
	};
	$(function(){		        
        $('#joinBtn').on('click', function() {
            ajaxJoin()
        });
        
	});
</script>
</head>
<body>
<%@include file="topmenu.jsp" %>
<h2>회원가입</h2>
<hr>
<form>
	<table border="1">
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="id" id="id">
				<input type="button" value="ID Check" id="checkBtn">
			</td>
		</tr>		
		<tr id="use"><td colspan="2">사용가능한 아이디 입니다.</td></tr>
		<tr id="notuse"><td colspan="2">사용 불가능한 아이디 입니다.</td></tr>
		<tr><th>PW</th><td><input type="password" name="pw" id="pw"></td></tr>
		<tr><th>PW2</th><td><input type="password" name="pw2" id="pw2"></td></tr>
		<tr><th>Name</th><td><input type="text" name="name" id="name"></td></tr>
		<tr><th>Age</th><td><input type="text" name="age" id="age"></td></tr>
		<tr><td colspan="2"><input type="button" value="회원가입" id="joinBtn"></td></tr>
	</table>
</form>
</body>
</html>