<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
	<jsp:include page="inc/top.jsp"/>
	</header>
	<article>
	<h1>MVC 게시판</h1>
	<h3><a href="BoardWriteForm.bo">글쓰기</a></h3>
	<h3><a href="BoardList.bo">글목록</a></h3>
	</article>
</body>
</html>