<%@page import="free_board.FreeBoardDAO"%>
<%@page import="free_board.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

// notice_update.jsp 페이지로부터 전달받은 폼파라미터 데이터 가져와서
// BoardDTO 객체에 저장 후 확인
int idx = Integer.parseInt(request.getParameter("idx"));
String pageNum = request.getParameter("pageNum");

FreeBoardDTO board = new FreeBoardDTO();
board.setIdx(idx);
board.setName(request.getParameter("name"));
board.setPass(request.getParameter("pass"));
board.setSubject(request.getParameter("subject"));
board.setContent(request.getParameter("content"));
// System.out.println(board);

// BoardDAO 객체의 updateBoard() 메서드를 호출하여 게시물 수정 작업 수행
// => 파라미터 : BoardDTO(board)    리턴타입 : int(updateCount)
FreeBoardDAO dao = new FreeBoardDAO();
int updateCount = dao.updateBoard(board);

// 수정 결과 판별
// 성공 시 상세 조회 페이지(notice_content.jsp)로 이동하고
// 아니면(실패 시) 자바스크립트로 "글 수정 실패!" 출력 후 이전페이지로 돌아가기
// (=> 파라미터로 글번호, 페이지번호 전달 필요)
if(updateCount > 0) {
	response.sendRedirect("free_content.jsp?idx=" + idx + "&pageNum=" + pageNum);
} else {
	%>
	<script>
		alert("글수정 실패!");
		history.back();
	</script>
	<%
}

%>    











