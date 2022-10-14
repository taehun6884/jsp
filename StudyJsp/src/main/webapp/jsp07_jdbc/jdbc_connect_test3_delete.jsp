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
	<h1>jdbc_connect_test3.jsp</h1>
	<%
	// JDBC 작업 4단계.
	// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp5";
	String user = "root";
	String password = "1234";
	
	// 1단계. JDBC 드라이버 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
	Connection con = DriverManager.getConnection(url, user, password);
	%>
	<h1>DB 연결 성공!</h1>
	<h3>Connection 객체 정보 : <%=con %></h3>
	<hr>
	
	<%
	int idx=5;
	String name = "조인성";
	
	String sql = "DELETE FROM student where idx = ?";
	
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	
	%>
	<h3>SQL 구문 전달 완료!</h3>
	<hr>
	
	<%
	// 4단계. SQL 구문 실행 및 결과 처리
	// PreparedStatement 객체의 executeXXX() 메서드를 호출하여 전달한 SQL 구문 실행
	// => 주의! Statement 객체의 executeUpdate(String sql) 호출이 아님! (파라미터 없음)
	int count = pstmt.executeUpdate();
	%>
	<h3>SQL 구문 실행 완료! - <%=count %></h3>
	
</body>
</html>









