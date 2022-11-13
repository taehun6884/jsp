<%@page import="free_board.FreeBoardDTO"%>
<%@page import="free_board.FreeBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 번호, 페이지번호 파라미터 가져오기
int idx = Integer.parseInt(request.getParameter("idx"));
String pageNum = request.getParameter("pageNum");

// BoardDAO 객체의 selectBoard() 메서드 호출하여 게시물 1개 정보 조회 - 메서드 재사용
// => 파라미터 : 글번호(idx)    리턴타입 : BoardDTO(board)
FreeBoardDAO dao = new FreeBoardDAO();
FreeBoardDTO board = dao.ListFreeBoardInfo(idx);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_update.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<%
	// 세션 아이디 가져와서 sId 변수에 저장
	String sId = (String)session.getAttribute("sId");
%>	
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img_center"></div>
		<!-- 왼쪽 메뉴 -->
		<jsp:include page="../inc/left.jsp" />
		<!-- 본문 내용 -->
		<article>
			<h1>Notice Update</h1>
			<form action="free_updatePro.jsp" method="post">
				<!-- 입력받지 않은 데이터(글번호, 페이지번호)도 폼 태그에 함께 포함시키기 -->
				<input type="hidden" name="idx" value="<%=idx %>">
				<input type="hidden" name="pageNum" value="<%=pageNum %>">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" value="<%=board.getName() %>"></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" value="<%=board.getSubject()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content"><%=board.getContent() %></textarea></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="글수정" class="btn">
					<input type="button" value="취소" class="btn" onclick="history.back()">
				</div>
			</form>
			<div class="clear"></div>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


