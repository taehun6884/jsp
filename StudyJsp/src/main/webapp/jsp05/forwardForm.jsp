<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardForm.jsp-포워딩 연습</h1>
	<form action="forwardPro.jsp" method="get">
		<input type="hidden" name="jumin" value="901010-1234567">
			
		<h3>아이디 : <input type="text" name="id"></h3>	
		<h3>비밀번호 : <input type="password" name="passwd"></h3>
		<input type="submit" value="전송">
		
		
	</form>	
</body>
</html>