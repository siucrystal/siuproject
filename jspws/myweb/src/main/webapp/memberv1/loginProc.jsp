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
%>    
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
boolean isId = false;
boolean isPw = false;
String name = "";
try {
	String driver = "com.mysql.cj.jdbc.Driver";
	Class.forName(driver);
	
	String url = "jdbc:mysql://localhost:3306/kdigital2307?ServerTimezone=UTC";
	String user = "root";
	String password = "rpass";
	
	conn = DriverManager.getConnection(url, user, password);
	out.print("Conn OK!!");
	
	String sql = "select idx, pw, name from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();	
	
	if(rs.next()){ // id 있는 경우
		if(pw.equals(rs.getString("pw"))){ // pw 맞는 경우
			isId = true;
			isPw = true;
			name = rs.getString("name");
		}else{ // pw 틀린경우
			isId = true;
		}
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>    
<%
if(isId & isPw){
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	response.sendRedirect("index.jsp");
}else{
%>
<script>
	alert("ID나 PW를 다시 확인해 주세요!!");
	history.go(-1);
</script>
<%	
}
%>










