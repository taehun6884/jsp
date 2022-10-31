<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션 아이디가 null 이거나 "admin" 이 아닐 경우 "잘못된 접근입니다!" 출력 후 메인페이지로 이동
String sId = (String)session.getAttribute("sId");
//System.out.println(sId);
//잘못된 접근일 때 바로 main.jsp 로 보내기
if(sId == null || !sId.equals("admin")) {
		response.sendRedirect("../main/main.jsp");
}

String id = request.getParameter("id");
System.out.println(id);

// MemberDAO 객체 생성 및 deleteMember() 호출
// => 파라미터 : id   리턴타입 : int(deleteCount)
MemberDAO dao = new MemberDAO();
int deleteCount = dao.deleteMember(id);

if(deleteCount > 0) {
//  	response.sendRedirect("admin_main.jsp");
%>
	<script>
	alert("회원 삭제 성공!");
	location.href = "admin_main.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("회원 삭제 실패!");
		history.back();
	</script>
<%	
}
%>

