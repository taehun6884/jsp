<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test6.jsp</h1>
	<form action="redirectServlet" method="GET">
		이름 : <input type="text" name="name">
		나이 : <input type="text" name="age">
		<input type="submit" value="redirectServlet서블릿 주소 요청(GET)">	
	</form>
	
	<form action="dispatchServlet" method="GET">
		이름 : <input type="text" name="name">
		나이 : <input type="text" name="age">
		<input type="submit" value="dispatchServlet 서블릿 주소 요청(POST)">	
	</form>
	
</body>
</html>