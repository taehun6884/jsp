<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test6_dispatch_result.jsp</h1>
	
	<%-- 이전 요청에서 전달받은 이름(name), 나이(age) 파라미터 출력하기 --%>
	<%-- EL 문법을 사용하여 출력 --%>
	<h3>이름 : ${param.name }</h3>
	<h3>나이 : ${param.age }</h3>
	
</body>
</html>












