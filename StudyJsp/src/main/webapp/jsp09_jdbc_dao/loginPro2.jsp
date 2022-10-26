<%@page import="jsp9_jdbc_dao.Jsp8_2DTO"%>
<%@page import="jsp9_jdbc_dao.Jsp8_2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Jsp8_2DAO dao = new Jsp8_2DAO();
// 	Jsp8_2DTO dto = new Jsp8_2DTO();
// 	dto.setId(id);
// 	dto.setPasswd(passwd);


	boolean result = dao.login(id, passwd);
	
	if(result == true){
		session.setAttribute("sId" , id);
		response.sendRedirect("index.jsp");
	}else{
	%>
	<script type="text/javascript">
		alert("로그인실패!");
		location.href = "loginForm2.jsp";
	</script>
	<% 	
	}
	%>
	
</body>
</html>