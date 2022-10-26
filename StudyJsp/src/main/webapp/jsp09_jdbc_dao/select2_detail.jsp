<%@page import="jsp9_jdbc_dao.Jsp8_2DTO"%>
<%@page import="jsp9_jdbc_dao.Jsp8_2DAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
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
		let result = confirm("삭제하시겠습니까?");
		
		if(result) {
			location.href = "delete2.jsp?id=" + id;
		}
	}
</script>
</head>
<body>
	<h1>회원 상세정보</h1>
	<%
	// URL 파라미터로 전달받은 아이디 가져와서 변수에 저장
	String id = request.getParameter("id");
	String sid= (String)session.getAttribute("sId");
	
	
	if(!id.equals(sid) && !sid.equals("admin")){
		%>
		<script type="text/javascript">
			alert("잘못된 접근입니다");
			location.href="index.jsp";
		</script>
		<%
	}
	Jsp8_2DAO dao = new Jsp8_2DAO();
	Jsp8_2DTO dto = dao.selectDetail(id);
	
	
	if(dto != null){
	%>
		<table border="1">
			<tr><td>이름</td><td><%=dto.getName() %></td></tr>
			<tr>
				<td>ID</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=dto.getPasswd() %></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>주민번호</td> -->
<%-- 				<td><%=dto.getJumin() %></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>E-Mail</td>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%=dto.getJob() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=dto.getGender()%></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><%=dto.getHobby()%></td>
			</tr>
			<tr>
				<td>가입동기</td>
				<td><%=dto.getContent() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="삭제" onclick="confirmDelete('<%=dto.getId()%>')">
					<input type="button" value="이전" onclick="history.back()">
				</td>
			</tr>
		</table>
		<%
		}
		%>
</body>
</html>













