<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function deleteConfirm() {
		const input = confirm("회원 탈퇴 하실건가요?");
		if (input) {
			location.href = "delete.jsp";
		}
		else return;
	};
	function deleteConfirm2() {
		const input = confirm("회원 탈퇴 하실건가요?");
		if (input) {
			location.href = "deleteJson.jsp";
		}
		else return;
	};
</script>
<h1>Member Service</h1>
<h2>
<a href="index.do">Home</a> |
<a href="memberList.do">회원목록</a> |
<a href="memberListJson.do">회원목록(JSON)</a> |
<a href="memberListJstl.do">회원목록(JSTL)</a> |
<a href="searchJson.jsp">회원이름검색</a> |

<% if (session.getAttribute("id") == null) { %>
	<a href="join.do">회원가입</a> |
	<a href="joinJson.do">회원가입(JSON)</a> |
	<a href="login.do">로그인</a> |
	
<% } else { %>
	<a href="update.do">정보수정</a> |
	<a href="updateJson.jsp">정보수정(JSON)</a> |
	<a href="#" onclick="deleteConfirm();">회원탈퇴</a> |
	<a href="#" onclick="deleteConfirm2();">회원탈퇴(JSON)</a> |
	<a href="logout.do">로그아웃</a> | <br>
	<%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>) 로그인 중
<% } %>
</h2>
<hr>