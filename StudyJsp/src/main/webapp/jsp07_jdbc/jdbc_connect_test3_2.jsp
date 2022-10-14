<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test3_2.jsp</h1>
	<%
	String driver="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp5";
	String user="root";
	String passwd = "1234";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url,user,passwd);
	
	
	int idx = 6;
	String name = "ㅇㅇㅇ";
	
// 	String sql = "INSERT INTO student VALUES("+idx+",'"+name+"')";
// 	PreparedStatement pstmt = con.prepareStatement(sql);
	
	String sql = "INSERT INTO student VALUES (?,?)";
	
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, idx);
	pstmt.setString(2,name);
	
	int count = pstmt.executeUpdate();
	
	%>
	
	<h3>insert문 성공 <%=count %></h3>
</body>
</html>









