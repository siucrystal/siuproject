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
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
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
	
	String sql = "insert into member (id, pw, name, age) values (?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setInt(4, age);
	
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
<%if(rs == 1){%>
	alert('회원가입을 축하 드립니다.');
	location.href = 'index.jsp';
<%}else{%>
	alert('죄송합니다. 잠시후에 다시 해주세요.');
	history.back();
<%}%>
</script>











