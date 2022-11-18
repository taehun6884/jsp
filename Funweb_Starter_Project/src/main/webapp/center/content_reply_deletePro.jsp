<%@page import="board.BoardReplyDAO"%>
<%@page import="board.BoardReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx =  Integer.parseInt(request.getParameter("idx"));
String pageNum = request.getParameter("pageNum");
String board_type = request.getParameter("board_type");
int ref_idx = Integer.parseInt(request.getParameter("ref_idx"));
BoardReplyDAO dao = new BoardReplyDAO();
int deleteCount = dao.deleteReply(idx);

if(deleteCount > 0){
	response.sendRedirect(board_type+"_content.jsp?idx="+ref_idx+"&pageNum="+pageNum);
	

}else{
	%>
	<script>
 	alert("삭제실패");
 	 
 	</script>
	
	<%
}
%>




