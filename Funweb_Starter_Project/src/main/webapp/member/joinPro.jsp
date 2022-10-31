<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
  request.setCharacterEncoding("UTF-8");
 
  MemberDTO dto = new MemberDTO();
  dto.setId(request.getParameter("id"));
  dto.setPass(request.getParameter("pass"));
  dto.setName(request.getParameter("name"));
  dto.setEmail(request.getParameter("email"));
  dto.setPost_code(request.getParameter("post_code"));
  dto.setPhone(request.getParameter("phone"));
  dto.setMobile(request.getParameter("mobile"));
  dto.setAddress1(request.getParameter("address1"));
  dto.setAddress2(request.getParameter("address2"));
  
  out.print(dto.toString());
  
  MemberDAO dao = new MemberDAO();
  int insertCount = dao.insertMember(dto);
  
  if(insertCount>0){
	  response.sendRedirect("../main/main.jsp");
  }else{
  %>
 	<script>
 		alert("회원가입 실패!");
 		history.back();
 	</script>
<%} %> 