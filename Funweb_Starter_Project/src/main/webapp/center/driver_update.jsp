<%@page import="board.FileBoardDTO"%>
<%@page import="board.FileBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pageNum = request.getParameter("pageNum");
	
	FileBoardDAO dao = new FileBoardDAO();
	FileBoardDTO dto = dao.selectFileBoard(idx);
	dto.getContent().replaceAll(System.getProperty("line.separator"), "<br>");
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice_update.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
			<form action="notice_updatePro.jsp" method="post">
				<input type="hidden" name="idx" value="<%=idx%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass" value="<%=dto.getPass()%>"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" value="<%=dto.getSubject()%>"></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><input type="text" name="file" value="<%=dto.getOriginal_file()%>"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content"><%=dto.getContent()%></textarea></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="글수정" class="btn">
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


