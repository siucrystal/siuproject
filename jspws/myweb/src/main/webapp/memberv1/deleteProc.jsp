<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
%>    
<%
Connection conn = null;
PreparedStatement pstmt = null;
int rs = 0;

try {
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	
	String url = "jdbc:mysql://localhost:3306/kdigital2307?ServerTimezone=UTC";
	String user = "root";
	String password = "rpass";
	
	conn = DriverManager.getConnection(url, user, password);
	out.print("Conn OK!!");
	
	String sql = "delete from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	rs = pstmt.executeUpdate();	
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>    
<script>
<%if(rs == 1){
	session.invalidate();
%>
	alert('회원탈퇴가 되었습니다. 그 동안 감사했습니다.');
	location.href = 'index.jsp';
<%}else{%>
	alert('죄송합니다. 잠시후에 다시 해주세요.');
	history.back();
<%}%>
</script>











