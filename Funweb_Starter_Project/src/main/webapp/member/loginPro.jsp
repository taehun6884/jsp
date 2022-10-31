<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pass = request.getParameter("pass");
	String id = request.getParameter("id");
	
	MemberDTO member = new MemberDTO();
	member.setPass(pass);
	member.setId(id);
	MemberDAO dao = new MemberDAO();
	boolean result= dao.isRightUser(member);
	
	if(result == true){
		session.setAttribute("sId", id);
		response.sendRedirect("../main/main.jsp");
	}else{
%>
	<script>
		alert("로그인 실패");
		history.back();
	</script>
	<%
	}
	%>