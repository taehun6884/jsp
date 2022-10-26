<%@page import="jsp9_jdbc_dao.Jsp8_2DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp9_jdbc_dao.Jsp8_2DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirmDelete(id) {
		// confirm dialog 사용하여 "XXX 회원을 삭제하시겠습니까?" 확인 요청
		// => 결과값이 true 일 경우 location.href='delete2.jsp' 페이지 이동
		let result = confirm(id + " 회원을 삭제하시겠습니까?");
		
		if(result) {
			location.href = "delete2.jsp?id=" + id;
		}
	}
</script>
</head>
<body>
	<% 
	request.setCharacterEncoding("UTF-8");
		
	String sid= (String)session.getAttribute("sId");
		
	if(sid == null || !sid.equals("admin")){
		%>
		<script>
			alert("잘못된 접근!");
			location.href="index.jsp";
			</script>			
		<%
		}
		%>
	<h1>회원 목록</h1>
	<table border="1">
		<tr>
			<th width="100">이름</th>
			<th width="100">아이디</th>
			<th width="200">E-Mail</th>
			<th width="50">성별</th>
			<th width="100">가입일</th>
			<th width="150"></th>
		</tr>
		<%
		// POST 방식에 대한 한글 처리
		
		Jsp8_2DAO dao = new Jsp8_2DAO();
		ArrayList selectLsit = dao.select();
		
		for(int i = 0; i<selectLsit.size();i++){
			Jsp8_2DTO dto = (Jsp8_2DTO)selectLsit.get(i);			
		%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getGender()%></td>
				<td><%=dto.getHobby() %></td>
				<td>
					<input type="button" value="상세정보" onclick="location.href='select2_detail.jsp?id=<%=dto.getId()%>'">
					<input type="button" value="삭제" onclick="confirmDelete('<%=dto.getId()%>')">
				</td>
			</tr>
		
		
			<%
		}
		%>
	
	</table>
</body>
</html>













