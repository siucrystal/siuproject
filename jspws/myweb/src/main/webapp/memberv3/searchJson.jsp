<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
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
function getJson(name){
    $.ajax({
      contentType: 'application/json',
      type: 'GET',
      url: 'searchProcJson.jsp',
      dataType: 'json',
      data: {name:name},
      success: function(data) {
        /* console.log("datalist : " + data['list']);
        console.log("data : " + data); */
        
        if(data != null) {
        	for (var i = 0; i < data.length; i++) {
        		var item = data[i];
                var name = data[i]['name']; // name 필드 추출
                var id = data[i]['id'];     // id 필드 추출
                
                // 이제 name과 id를 사용하여 원하는 작업 수행
                console.log("이름: " + name);
                console.log("아이디: " + id);
                
                // 또는 원하는 HTML 요소에 값 추가
                $('#idResult').append("이름: " + name + ", 아이디: " + id + "<br>");
            }
        }else { 
        	console.log("하.. 으이!!");
        	$('#idResult').append("다시 입력해주세요");
        }
      },
      error: function(xhr, status, error) {
        console.log(xhr, status, error);
      }
    });
}

/* function innerHtml(data){
	
    let name_v = $("#name").val();   
	for(item of data){
		const {name} = item;
		console.log("이 이름 : " + name_v);
		if(name_v == name) {
			console.log("내 짝을 찾았다~~");
		}else {
			console.log("하..");
		}
		
    }	
	alert("이것은 되나요?");
	
} */

$(function() {
	$('#nameSearch').click(function(){
		var name = $("#name").val(); // input의 value 가져오기
		$('#idResult').html('');
    	getJson(name);
	})
});
  
</script>
</head>
<body>
<%@include file="topmenu.jsp" %>
	<h2>회원이름검색</h2>
	<form action="memberListData.jsp" method="GET">
		<input type="text" name="name" id="name">
		<input type="button" value="검색" id="nameSearch">
		<h1>해당되는 회원의 아이디는 </h1>
		<h3><hr><span id="idResult"></span></h3>
	</form>
</body>
</html>





