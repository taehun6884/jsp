<%@page import="jsp9_jdbc_dao.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp9_jdbc_dao.StudentDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th><th>이름</th>
		</tr>
	<%
		StudentDAO dao = new StudentDAO();
		ArrayList studentList = dao.select();
	
		for(int i =0;i<studentList.size();i++){
// 			Object o = studentList.get(i);
// 			StudentDTO student = (StudentDTO)o;

			StudentDTO student = (StudentDTO)studentList.get(i);
		
			
	%>
			<tr>
				<td><%=student.getIdx() %></td><td><%=student.getName() %></td>
			</tr>	
		<%
		}
		%>
	
	</table>
	
</body>
</html>