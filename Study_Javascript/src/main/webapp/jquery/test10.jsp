<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// on("change", 함수() {})
	// => 특정 대상의 "상태가 변하면" 동작하는 이벤트 처리
	$(function() {
		$("table").css("width", "300px");
		$("table").css("text-align", "center");
	});
</script>
</head>
<body>
	<h1>jQuery - test10.jsp</h1>
	<table border="1">
        <tr>
        	<td colspan="3">
		        <select id="selectBox" name="subject">
					<option value="전체">전체</option>
					<option value="VIP">VIP</option>
					<option value="일반">일반</option>
				</select>
			</td>
		</tr>
        <tr>
            <th><input type="checkbox" id="allCheck">전체선택</th>
            <th>번호</th>
            <th>이름</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>1</td>
            <td>홍길동</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>2</td>
            <td>이순신</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>3</td>
            <td>강감찬</td>
        </tr>
        <tr>
        	<td colspan="3">
		        <select id="searchType" name="searchType">
					<option value="이름">이름</option>
					<option value="아이디">아이디</option>
				</select>
				<input type="text" name="search" placeholder="검색어 입력">
			</td>
		</tr>
    </table>
    <div id="result"></div>
</body>
</html>