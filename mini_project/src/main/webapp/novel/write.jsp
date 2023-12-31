<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="./css/write.css">
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script>
 function writeBoard() {
	 <% String id = (String)session.getAttribute("id"); 
	 	String name = (String)session.getAttribute("nickname");
	 %>
		const id = "<%=id%>";
		const name = "<%=name%>";
		const title = $('#wTitle').val();
		const context = $('#wContext').val();
		const param = {title:title, context:context, id:id, name:name};
		                                                                                                                                                                                                                                                                                                                                                    
		$.ajax({
	        type: 'POST',
	        url: 'writeJson.json',
	        dataType: 'json',
	        data: param,
	        success: function(data) {
	        	console.log("data : "+ data);
	        	console.log("param : "+ param);
	        	
	        	if (data['rs'] === 1) {
	        		alert('게시글이 작성되었습니다');
	        		location.href = 'board.do';
	        	}
				else alert('죄송합니다 잠시 후에 다시 시도해주세요 ㅠ');
	        }, error: function(xhr, status, error) {
	        	console.log(xhr, status, error);
	        }
		});
	};
	
	$(function() {
		$('#writeBtn').click(function() {
			writeBoard();
			const id = "<%=id%>";
			console.log("id : " + id);
			
			if (id === null || id.trim() === '') {
	            alert("게시글을 작성하려면 로그인을 먼저 하셔야됩니다");
	            location.href = 'login.do';
	        }
		});
	});
	$(function() {
		$('#resetBtn').click(function() {
			$('#wTitle').val('');
			$('#wContext').val('');
		});
	});
	$(function() {
		$('#listBtn').click(function() {
			const wCheck = confirm("게시글 작성 안하실건가요?");
			if(!(wCheck == false)) {
				location.href = 'board.jsp';				
			}
		});
	});
</script>
<title>write</title>

</head>
<%@include file="../home/topmenu.jsp" %>
<body>
	 <div class="wrap">
        <h1>회원제 게시판 - 글쓰기</h1>
        <form action="view">
            <div class="main">
                <table border="1">
                    <tbody>
                        <tr>
                            <td class="w_name">제목</td>
                            <td><input type="text" name="wTitle" id="wTitle"></td>
                        </tr>
                        <tr>
                            <td class="w_name">내용</td>
                            <td><input type="text" name="wContext" id="wContext"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="w_btn">
                                <input type="hidden" name="category" value="소설" id="cateHidden">
                                <input type="button" value="작성 완료" id="writeBtn">
                                <input type="button" value="다시 입력" id="resetBtn">
                                <input type="button" value="목록 보기" id="listBtn">
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</body>
</html>