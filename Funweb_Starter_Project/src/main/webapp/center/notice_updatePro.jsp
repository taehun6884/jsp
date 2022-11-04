<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDTO dto = new BoardDTO();
	dto.setName(request.getParameter("name"));
	dto.setPass(request.getParameter("pass"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
 	dto.setIdx(idx);
	
	BoardDAO dao = new BoardDAO();

	int updateCount = dao.updateBoard(dto);
	
	
	if(updateCount > 0){
	response.sendRedirect("notice_content.jsp?idx="+idx +"&pageNum="+pageNum);
	
	}else{ %>
		<script>
			history.back();
		</script>
	<%} %>


