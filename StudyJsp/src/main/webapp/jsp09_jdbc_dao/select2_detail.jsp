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
// 	out.println(id);

	// JDBC 작업 4단계.
	// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp5";
	String user = "root";
	String password = "1234";
	
	// 1단계. JDBC 드라이버 로드
	Class.forName(driver);
	
	// 2단계. DB 연결
	// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
	Connection con = DriverManager.getConnection(url, user, password);
	
	// 아이디가 일치하는 레코드 조회
	String sql = "SELECT * FROM jsp8_2 WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()) {
		String name = rs.getString("name");
// 		String id = rs.getString("id"); // 이미 파라미터로 전달받음
		String passwd = rs.getString("passwd");
		String jumin = rs.getString("jumin");
		String email = rs.getString("email");
		String job = rs.getString("job");
		String gender = rs.getString("gender");
		String hobby = rs.getString("hobby");
		String content = rs.getString("content");
		// 데이터베이스로의 날짜 정보를 사용할 경우 
		// java.sql.Date(날짜만) 또는 java.sql.TimeStamp(날짜&시각) 사용
		Date hire_date = rs.getDate("hire_date");
		
		%>
		<table border="1">
			<tr><td>이름</td><td><%=name %></td></tr>
			<tr>
				<td>ID</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=passwd %></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><%=jumin %></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><%=email %></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%=job %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=gender %></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><%=hobby %></td>
			</tr>
			<tr>
				<td>가입동기</td>
				<td><%=content %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="삭제" onclick="confirmDelete('<%=id%>')">
					<input type="button" value="이전" onclick="history.back()">
				</td>
			</tr>
		</table>
		<%
	}
	%>
</body>
</html>













