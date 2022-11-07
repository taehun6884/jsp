<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/driver_write.jsp</title>
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
			<h1>driver Write</h1>
			<form action="driver_writePro.jsp" method="post" enctype="multipart/form-data">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" value="<%=sid %>" readonly="readonly"></td>
					</tr> 
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="20" name="content"></textarea></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><input type="file" name="original_file" required="required"></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="글쓰기" class="btn">
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


