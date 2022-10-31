<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		BoardDTO dto = new BoardDTO();
		dto.setName(request.getParameter("name"));
		dto.setPass(request.getParameter("pass"));
		dto.setContent(request.getParameter("content"));
		dto.setSubject(request.getParameter("subject"));
		
		BoardDAO dao = new BoardDAO();
		int result = dao.insertBoard(dto);
	%>
</body>
</html>