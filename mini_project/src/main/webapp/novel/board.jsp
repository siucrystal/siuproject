<%@page import="novel.NovelDAOImpl"%>
<%@page import="novel.NovelDTO"%>
<%@page import="java.util.List"%>
<%@page import="novel.PagingDTO"%>
<%@page import="novel.NovelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="./css/board_css.css">
 <!-- <link rel="stylesheet" type="text/css" href="../css/reset.css"> -->
<title>board</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 이건 write 작성할때 로그인 되어있는지 확인 -->
<%
	request.setCharacterEncoding("utf-8");

	int listNum = 5;
	int blockNum = 5;
	int pageNum = 1;
	if(request.getParameter("page") != null){
		pageNum = Integer.parseInt(request.getParameter("page"));
	};	
	
	NovelDAO dao = new NovelDAOImpl();
	List<NovelDTO> list = dao.getPostList(pageNum, listNum);
	int totalCount = dao.getMemberCount(); 
%>
<%	
	//paging
	PagingDTO paging = new PagingDTO(totalCount, pageNum, listNum, blockNum);
	paging.setPaging();	
	
	int totalPage = paging.getTotalPage();
	int startPage = paging.getStartPage();
	int endPage = paging.getEndPage();
	boolean isPrev = paging.isPrev();
	boolean isNext = paging.isNext();
	boolean isBPrev = paging.isBPrev();
	boolean isBNext = paging.isBNext();
%>
<script>
function getBoardJson() {
	const pageNum = <%=pageNum%>;
	const listNum = <%=listNum%>;
	$.ajax({
        type: 'GET',
        url: 'board.json',
        dataType: 'json',
        data: {pageNum:pageNum, listNum:listNum},
        success: function(data) {
            let tr = '';
            for (item of data) {
                const {id, num, nickname, title, postdate, visit_count} = item;
				console.log("item : "+ item);
                tr += '<tr style="text-align: center;">' +
                	'<td class="tul_span"><a href="view.jsp?num='+ num +'&id='+ id +'&num2='+ num +'&num3='+ num +'&num4='+ num +'&num5='+ num +'&num6='+ num +'">' + num + '</a></td>' +
                    '<td class="tul_span"><a href="view.jsp?num='+ num +'&id='+ id +'&num2='+ num +'&num3='+ num +'&num4='+ num +'&num5='+ num +'&num6='+ num +'">' + title + '</a></td>' +
                    '<td class="tul_span"><a href="view.jsp?num='+ num +'&id='+ id +'&num2='+ num +'&num3='+ num +'&num4='+ num +'&num5='+ num +'&num6='+ num +'">' + nickname + '</a></td>' +
                    '<td class="tul_span"><a href="view.jsp?num='+ num +'&id='+ id +'&num2='+ num +'&num3='+ num +'&num4='+ num +'&num5='+ num +'&num6='+ num +'">' + postdate + '</a></td></tr>';
            }
            $('#tbody').html(tr); // 이 줄을 사용하여 데이터를 추가합니다.
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

$(function() {
    getBoardJson();
    
});
</script>

<script>
<% String id = (String)session.getAttribute("id"); %>

 function writeBtn() {
	 	const id = "<%=id%>";
		const param = {id:id};
		$.ajax({
	        type: 'POST',
	        url: 'idCheck.json',
	        dataType: 'json',
	        data: param,
	        success: function(data) {
	        	console.log("id : " + id);
	        	console.log("data : " + data);
	        	console.log("data['rs'] : " + data['rs']);
	        	if (data['rs'] === 1) {
	        		location.href = 'write.jsp';
	        	}else {
        		 	alert("게시글을 작성하려면 로그인을 먼저 하셔야됩니다");
	 	            location.href = '../member/login.do';
	        	}
	        }, error: function(xhr, status, error) {
	        	console.log(xhr, status, error);
	        }
		});
	};
	$(function() {
		$('#b_writeBtn').click(function() {
			writeBtn();
			const id = "<%=id%>";
			console.log("id : " + id);
			
			if (id === null || id.trim() === '') {
	            alert("게시글을 작성하려면 로그인을 먼저 하셔야됩니다");
	            location.href = 'login.do';
	        }
			
		});
	});
	
</script>
</head>
<%@include file="../home/topmenu.jsp" %>
<body>
	<h1>소설 게시판</h1>
	<form action="write">
		<h2>회원목록 : <%=pageNum %>/<%=totalPage %> (<%=totalCount %>)</h2>
		<div class="board_box">
			<div>
				<div>
					<select>
						<option>제목</option>
						<option>내용</option>
						<option>작성자</option>
					</select>
					<input type="text" name="b_search" id="b_search">
					<input type="button" value="검색하기" id="b_searchBtn">
				</div>
			</div>
		
			<table class="table_ul" border="1">
				<thead>
			        <tr class="tul_th">
			            <th class="th_span th_num">번호</th>
			            <th class="th_span">제목</th>
			            <th class="th_span">작성자</th>
			            <th class="th_span">작성일</th>
			        </tr>
			    </thead>
	            <tbody id="tbody">
	               <!--  <tr>
	                    <td class="tul_span"><a href="view.jsp">0</a></td>
	                    <td class="tul_span"><a href="view.jsp">게시글 한번 써보고 싶었어요 ㅎㅎ</a></td>
	                    <td class="tul_span"><a href="view.jsp">test1</a></td>
	                    <td class="tul_span"><a href="view.jsp">1</a></td>
	                    <td class="tul_span"><a href="view.jsp">2023-04-03</a></td>
	                </tr> -->
	                
	            </tbody>
	        </table>
		
		
			<div><%if(isBPrev){ %> <a href="../novel/board.jsp?page=<%=startPage-1%>">&nbsp;<<&nbsp;</a> <%} %>
						<%if(isPrev){ %> <a href="../novel/board.jsp?page=<%=pageNum-1%>">&nbsp;<&nbsp;</a> <%} %>
						
						<%for(int i=startPage; i<=endPage; i++) {%>
							<%if(i == pageNum) {%>
								<span style="color:red;">&nbsp;<%=i %>&nbsp;</span>
							<%}else{%>
								<a href="../novel/board.jsp?page=<%=i%>">&nbsp;<%=i %>&nbsp;</a>
							<%} %>
						<%}%>
						
						<%if(isNext){ %> <a href="../novel/board.jsp?page=<%=pageNum+1%>">&nbsp;>&nbsp;</a> <%} %>
						<%if(isBNext){ %> <a href="../novel/board.jsp?page=<%=endPage+1%>">&nbsp;>>&nbsp;</a> 
						<%} %></div>
			<div><input type="button" value="글쓰기" id="b_writeBtn"></div>
		</div>
	</form>
</body>
</html>







