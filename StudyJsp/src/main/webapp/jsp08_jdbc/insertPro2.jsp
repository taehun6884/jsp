<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
jsp8_2 테이블 생성
---------------------------
이름(name) - 문자 10자 NN
아이디(id) - 문자 10자 UN NN
비밀번호(passwd) - 문자 16자 NN
주민번호(jumin) - 문자 14자 UN NN
이메일(email) - 문자 50자 UN NN
직업(job) - 문자 10자 NN
성별(gender) - 문자 1자 NN
취미(hobby) - 문자 10자 NN
가입동기(content) - 문자 100자 NN
가입일(hire_date) - 날짜(DATE) NN
--------------------------------------
CREATE TABLE jsp8_2 (
	name VARCHAR(10) NOT NULL,
	id VARCHAR(10) UNIQUE NOT NULL,
	passwd VARCHAR(16) NOT NULL,
	jumin VARCHAR(14) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	job VARCHAR(10) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hobby VARCHAR(10) NOT NULL,
	content VARCHAR(100) NOT NULL,
	hire_date DATE NOT NULL
);
*/

request.setCharacterEncoding("UTF-8");

// insertForm2.jsp 페이지로부터 전달받은 폼 파라미터 가져와서 변수에 저장
String name = request.getParameter("name");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
String email = request.getParameter("email1") + "@" + request.getParameter("email2");
String job = request.getParameter("job");
String gender = request.getParameter("gender");
// 취미는 체크박스 형태로 복수개의 동일한 이름을 갖는 파라미터로 전달될 수 있으므로
// request 객체의 getParameterValues() 메서드를 호출하여 복수개의 파라미터를 
// String[] 타입 배열로 관리 가능
// => 각 배열에 저장된 각각의 취미를 "/" 구분자를 사용하여 hobby 변수에 결합
//    ex) 여행과 독서 체크했을 경우 각 항목의 뒤에 "/" 구분자 붙여서 문자열 결합
//        => "여행/독서/"
String hobby = "";
String[] arrHobbies = request.getParameterValues("hobby");
// for 문을 활용하여 arrHobbies 배열 크기만큼 반복하면서 각 배열 요소 문자열로 결합
// for(int i = 0; i < arrHobbies.length; i++) {
// 	hobby += arrHobbies[i] + "/";
// }

// 향상된 for문 사용 시
for(String strHobby : arrHobbies) { 
	// 우변의 배열 arrHobbies 요소 하나씩 꺼내서 좌변의 String 타입 변수 strHobby 에 저장(반복) 
	hobby += strHobby + "/";
}

String content = request.getParameter("content");
// out.println(name + "<br>" + id + "<br>" + passwd + "<br>" + jumin + "<br>" + email + "<br>" + job + "<br>" + gender + "<br>" + hobby + "<br>" + content);

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

// jsp8_2 테이블에 1개 레코드에 해당하는 모든 데이터 저장
// 단, 입사일(hire_date)는 SQL 구문의 now() 함수 사용하여 DB 서버의 현재 날짜, 시각정보를 사용
String sql = "INSERT INTO jsp8_2 VALUES (?,?,?,?,?,?,?,?,?,now())";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, id);
pstmt.setString(3, passwd);
pstmt.setString(4, jumin);
pstmt.setString(5, email);
pstmt.setString(6, job);
pstmt.setString(7, gender);
pstmt.setString(8, hobby);
pstmt.setString(9, content);

int count = pstmt.executeUpdate();

// INSERT 완료 후 성공 시 select2.jsp 페이지로 이동하고
// (select2.jsp 페이지에서 jsp8_2 테이블의 모든 레코드 조회하여 웹페이지에 출력)
// 실패 시 자바스크립트를 사용하여 "회원 가입 실패!" 출력 후 이전페이지로 돌아가기
if(count > 0) { // 성공
	response.sendRedirect("select2.jsp");
} else { // 실패
	%>
	<script>
		alert("회원 가입 실패!");
		history.back();
	</script>
	<%
}
%>














