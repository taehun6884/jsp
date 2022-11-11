<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");

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
	if(sId == null || !sId.equals("admin")) {
// 		System.out.println("세션 아이디 없음!");
		// 세션 아이디가 없을 경우 "잘못된 접근입니다!" 출력 후 이전페이지로 돌아가기
		%>
		<script type="text/javascript">
		alert("잘못된 접근입니다!");
		history.back();
		</script>
		<%
	}
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
			<h1>email</h1>
				<form action="mail.Pro.jsp"  method="post">
					<input type="hidden" name="sender" value=<%=sId %>>
					<table border="1" id="notice">
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" rows="20" cols="40"></textarea></td>
						</tr>
					</table>		

				<div id="table_search">
					<input type="submit" value="메일 전송" class="btn">
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


