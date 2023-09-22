<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 form</title>
</head>
<body>
	<h1>회원가입</h1>
	<h2>회원가입을 위한 정보를 입력해주세요</h2>
	<form action="memberview.jsp" method="get" onsubmit="return doAction();">
		<h3>
			ID : <input type="text" name="id" placeholder="id를 입력해주세요" id="m_id"><br><br>
			PW : <input type="text" name="pw" placeholder="pw를 입력해주세요" id="m_pw"><br><br>
			NAME : <input type="text" name="name" placeholder="이름을 입력해주세요" id="m_name"><br><br>
			AGE : <input type="text" name="age" placeholder="나이를 입력해주세요" id="m_age">
			<br><br>
			<input type="submit" value="회원 가입하기">
		</h3>
	</form>
	
	<script>
		function doAction() {
			let m_id = document.getElementById("m_id");
			let m_pw = document.getElementById("m_pw");
			let m_name = document.getElementById("m_name");
			let m_age = document.getElementById("m_age");
			
			if(m_id.value.length == 0 || m_pw.value.length == 0 || m_name.value.length == 0 || m_age.value.length == 0) {
				alert("회원가입을 위해 값을 입력해 이쉐키야!!");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>