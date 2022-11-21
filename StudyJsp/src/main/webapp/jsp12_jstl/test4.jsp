<%@page import="java.util.ArrayList"%>
<%@page import="jsp11_dbcp.StudentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에 다음 데이터 저장
// => 속성명 : idx, 데이터 : 3
// => 속성명 : name, 데이터 : "홍길동"
request.setAttribute("idx", 3);
request.setAttribute("name", "홍길동");

// jsp11_dbcp.StudentDTO 객체 생성 후 List 객체(studentList)에 추가
List<StudentDTO> studentList = new ArrayList<StudentDTO>();
studentList.add(new StudentDTO(1, "홍길동"));
studentList.add(new StudentDTO(2, "이순신"));
studentList.add(new StudentDTO(3, "강감찬"));

// request 객체에 List 객체 저장
request.setAttribute("studentList", studentList);

// String 타입 배열 names 생성 및 이름 저장 => request 객체에 저장
String[] names = {"홍길동", "이순신", "강감찬"};
request.setAttribute("names", names);

// response.sendRedirect("test4_result.jsp");
// request 객체를 유지하면서 test4_result.jsp 페이지로 포워딩하기 위해
// response.sendRedirect() 메서드가 아닌 pageContext.forward() 메서드로 포워딩 = Dispatch 방식
pageContext.forward("test4_result.jsp");
%>












