<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<h3><a href="myServlet">myServlet 서블릿 주소 요청(GET)</a></h3>
	
	<form action="myServlet"> <!-- method 속성 생략 시 GET 방식 요청 -->
		<input type="submit" value="myServlet 서블릿 주소 요청(GET)">
	</form>
	
	<form action="myServlet" method="POST">
		<input type="submit" value="myServlet 서블릿 주소 요청(POST)">
	</form>
	
	<form action="myServlet_fail" method="POST">
		<input type="submit" value="myServlet_fail 서블릿 주소 요청(실패)">
	</form>
</body>
</html>












