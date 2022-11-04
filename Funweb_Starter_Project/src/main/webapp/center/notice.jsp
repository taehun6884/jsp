<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// board 테이블의 게시물 목록 조회
BoardDAO dao = new BoardDAO();

// BoardDAO 객체의 selectBoardList() 메서드를 호출하여 게시물 목록 조회
// => 파라미터 : 없음, 리턴타입 : List<BoardDTO>(boardList)
// (단, 임시로 페이징 처리 없이 전체 목록 조회)
// List<BoardDTO> boardList = dao.selectBoardList();

// ------------------------------------------------------------------------------
// 페이징 처리에서 사용되는 게시물 목록 조회를 위한 계산 작업
// 1. 한 페이지에서 표시할 게시물 목록 수와 페이지 목록 수 설정
int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한

// 2. 현재 페이지 번호 설정(pageNum 파라미터 사용)
// => pageNum 파라미터가 존재하면 해당 값을 저장하고, 아니면 기본 값 1 사용
int pageNum = 1;
if(request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
// System.out.println(pageNum);

/*
3. 현재 페이지에서 목록으로 표시할 첫 게시물의 행(레코드) 번호 계산
   => (현재 페이지번호 - 1) * 페이지 당 게시물 목록 갯수
------------------------------------------------------------------------------------
pageNum(페이지번호)  listLimit(게시물 수)    startRow(시작행번호)   endRow(끝행번호)
------------------------------------------------------------------------------------
        1                    10              (1 - 1) * 10 =  0행        (~ 9행)
        2                    10              (2 - 1) * 10 = 10행       (~ 19행)
        3                    10              (3 - 1) * 10 = 20행       (~ 29행)
*/
int startRow = (pageNum - 1) * listLimit;
// 끝 행번호는 계산 불필요(시작행번호부터 시작하여 페이지 당 게시물 수 만큼 조회)

// BoardDAO 객체의 selectBoardList() 메서드를 호출하여 게시물 목록 조회
// => 파라미터 : 시작행번호, 페이지 당 게시물 목록 수 
// => 리턴타입 : List<BoardDTO>(boardList)
List<BoardDTO> boardList = dao.selectBoardList(startRow, listLimit);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
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
			<h1>Notice</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Write</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<!-- 글목록을 반복 표시할 위치 -->
				<!-- List 객체(boardList) 크기만큼 반복 -->
				<%
// 				for(int i = 0; i < boardList.size(); i++) {
// 					BoardDTO board = boardList.get(i);
// 				}
				
				// 향상된 for문 활용
				for(BoardDTO board : boardList) {
				%>
					<tr onclick="location.href ='notice_content.jsp?idx=<%=board.getIdx() %>&pageNum=<%=pageNum%>'">
						<td><%=board.getIdx() %></td>
						<td class="left"><%=board.getSubject() %></td>
						<td><%=board.getName() %></td>
						<%
						// 작성일자(날짜 및 시각) 표시 형식 변경을 위해 java.text.SimpleDateFormat 객체 활용
						// => 생성자 파라미터로 표시 형식 문자열을 사용한 패턴 지정
						//    ex) 연연-월월-일일 시시:분분 형식 지정 시 "yy-MM-dd HH:mm" 패턴 활용하면
						//        "22-11-02 11:27" 형태로 표시됨
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
						// => 패턴이 저장된 SimpleDateFormat 객체의 format() 메서드를 호출하여 변환할 날짜를 전달 시
						//    전달된 날짜가 해당 패턴에 맞게 변환됨 => 출력 위치에서 즉시 사용 가능
 						%>
						<td><%=sdf.format(board.getDate()) %></td> <!-- 출력 날짜 형식 변환 -->
						<td><%=board.getReadcount() %></td>
					</tr>
				<%
				}
				%>
			</table>
			<div id="table_search">
				<input type="button" value="글쓰기" class="btn" onclick="location.href='notice_write.jsp'">
			</div>
			<div id="table_search">
				<form action="#" method="post">
					<input type="text" name="search" class="input_box">
					<input type="submit" value="Search" class="btn">
				</form>
			</div>

			<div class="clear"></div>
			<%
			// 0. BoardDAO 객체의 selectListCount() 메서드를 호출하여 전체 게시물 수 조회(페이지 목록 계산에 사용)
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = dao.selectListCount();
			System.out.println("총 게시물 수 : " + listCount);
			int pageListLimit = 10; // 한 페이지에서 표시할 페이지 목록을 3개로 제한
			
// 			int maxPage = listCount / listLimit;
			
// 			if(listCount % listLimit > 0){
// 				maxPage++;
// 			}
			int maxPage = listCount / listLimit + (listCount % listLimit == 0 ? 0 : 1);
			
			//System.out.println(maxPage);
			
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit +1;
			System.out.println(startPage);
			
			int endPage = startPage + pageListLimit -1;
			
			if(endPage > maxPage){
				endPage = maxPage;
			}
			%>
			<div id="page_control">
				<%if(pageNum > 1){ %>
				<a href="notice.jsp?pageNum=<%=pageNum - 1%>">Prev</a>
				<%
				}else{ 
				%>
				<a href="javascript:void(0)">Prev</a>
				<%
				}
				%>
				
				
				
				<%for(int i=startPage;i<=endPage;i++){ %>
					<%if(pageNum == i ){ 
						%>
						<a href="javascript:void(0)"><%=i %></a>
						<%
					}else{
						%>
						<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
					<%
					}
					%>				
				<%
				}
				%>
				
				<%if(maxPage > pageNum ){ %>
				<a href="notice.jsp?pageNum=<%=pageNum + 1%>">Next</a>
				<%}else{ %>
				<a href="javascript:void(0)">Next</a>
				<%
				}
				%>
			</div>
		</article>

		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


