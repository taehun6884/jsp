<%@page import="member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// URL 파라미터로 전달받은 아이디 가져와서 변수에 저장
	
	String sid = (String)session.getAttribute("sId");
	String id = request.getParameter("id");
	if(id == null || id == null || id.equals("") || !sid.equals(id) && !sid.equals("admin")){
	%>
			<script>
			alert("잘못된 접근입니다.");
			location.href = "../main/main.jsp";
			</script>
	<%
			} 
	%>	
	<%
	// out.println(id);
	MemberDAO dao = new MemberDAO();
	int deleteCount = dao.deleteMember(id);
	
	if(deleteCount > 0) {
		if(sid.equals("admin")){
			response.sendRedirect("../admin/admin_main.jsp");
		}else{
			session.invalidate();
			response.sendRedirect("../main/main.jsp");
		}
	} else {
		%>
		<script>
			alert("회원 삭제 실패!");
			history.back();
		</script>
		<%
	}
	%>













