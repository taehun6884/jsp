<%@page import="java.util.List"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 아이디가 null 이거나 "admin" 이 아닐 경우 "잘못된 접근입니다!" 출력 후 메인페이지로 이동
String sId = (String)session.getAttribute("sId");
// System.out.println(sId);
// 잘못된 접근일 때 바로 main.jsp 로 보내기
if(sId == null || !sId.equals("admin")) {
		response.sendRedirect("../main/main.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function confirm_delete(id) {
		let result = confirm(id + " 회원을 삭제하시겠습니까?");
		if(result) {
			location.href = "../member/member_delete.jsp?id=" + id;
		}
	}
</script>

</head>
<body>
<%-- 	<%if(sId == null || !sId.equals("admin")) { %> --%>
<!-- 		<script> -->
<!--  			alert("잘못된 접근입니다!"); -->
<!--  			locaion.href = "../main/main.jsp"; -->
<!-- 		</script> -->
<%-- 	<%} %> --%>
	<h1>admin_main.jsp - 관리자 페이지</h1>
	<!-- member 테이블의 모든 레코드 조회하여 테이블에 출력 -->
	<%
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> memberList = dao.selectMemberList();
// 	System.out.println(memberList);
	
	%>
	<table border="1">
		<tr>
			<th>아이디</th><th>이름</th><th>E-Mail</th><th>Mobile</th><th>가입일</th><th>기타</th>
		</tr>
		<%
// 		for(int i = 0; i < memberList.size(); i++) {
// 			MemberDTO member = memberList.get(i); // ArrayList 는 Object 타입!! 다운캐스팅 필수!!
		for(MemberDTO member  : memberList ){
			%>
		<tr>
			<td><%=member.getId() %></td>
			<td><%=member.getName() %></td>
			<td><%=member.getEmail() %></td>
			<td><%=member.getMobile() %></td>
			<td><%=member.getDate() %></td>
			<td>
				<input type="button" value="상세조회" name="info_detail" onclick="location.href='../member/member_info.jsp?id=<%=member.getId() %>'">
				<input type="button" value="삭제" name="member_delete" onclick="confirm_delete('<%=member.getId() %>')">
			</td>
		</tr>
			<%
		}
		%>
		<tr><td colspan="6" align="right"><input type="button" value="메인 페이지로 이동" name="" onclick="location.href='../main/main.jsp'">
	</table>

</body>
</html>