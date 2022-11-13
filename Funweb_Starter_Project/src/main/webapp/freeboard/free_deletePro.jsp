<%@page import="free_board.FreeBoardDAO"%>
<%@page import="free_board.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//파라미터 idx, pageNum 받아오기
int idx = Integer.parseInt(request.getParameter("idx"));
String pageNum = request.getParameter("pageNum");

FreeBoardDTO dto = new FreeBoardDTO();
dto.setPass(request.getParameter("pass"));

FreeBoardDAO dao = new FreeBoardDAO();

int deleteCount = dao.deleteFreeBoard(dto);

if(deleteCount > 0) {
	response.sendRedirect("free_board.jsp");
} else {
	%>
	<script>
		alert("삭제 실패!");
		history.back();
	</script>
	<%
}

%>
