<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	/*
	eq(인덱스)
	- 선택자를 포함하여 형제자매 요소 탐색
	- 인덱스는 0부터 시작하며, 인덱스에 해당하는 순서에 위치한 요소를 가져옴
	- 음수는 뒤에서부터 탐색
	
	attr('HTML속성명')
	- 선택자에서 해당 속성의 값을 가져오거나 추가
	- HTML 태그 속성값 자체를 가져오며 상태에 따라 변하지 않음
	  ex) 체크박스 checked="checked" 속성값을 가져올 때 체크상태가 변해도 checked 임
	  
	prop('Javascript속성명')
	- 선택자에서 해당 속성의 값에 대한 상태를 가져오거나 추가
	- 값 자체를 다루지 않고 해당 속성의 값에 대한 true/false 리턴
	- attr() 함수와 유사하나 HTML 태그의 상태에 따라 결과값이 변함
	  ex) 체크박스 checked="checked" 의 속성값을 가져올 때
	      체크박스 체크 시 true 리턴, 해제 시 false 리턴
	
	is()
	- 선택자가 입력한 값과 관련된 상태 확인 후 일치 여부(true/false) 리턴
	- 선택자의 실행 결과나 태그 확인용
	- prop() 함수 리턴값을 boolean 타입으로 비교하는 것과 동일
	*/
	$(function() {
		// 버튼 클릭 시 이벤트 수행
		$("#btn").click(function() {
			// 선택자 요소에 eq() 함수를 사용하여 요소들 중 인덱스에 해당하는 요소 지정
			// => 요소 지정 후 attr() 또는 prop() 함수를 통해 해당 요소의 속성에 접근
			let attr1 = $("input[type=checkbox]").eq(1).attr("checked");
			// => checked 속성이 존재하므로 항상 checked
			let prop1 = $("input[type=checkbox]").eq(1).prop("checked");
			// => checked 속성의 체크 상태에 따라 true 또는 false
			let attr2 = $("input[type=checkbox]").eq(2).attr("checked");
			// => checked 속성이 존재하지 않으므로 undefined
			let prop2 = $("input[type=checkbox]").eq(2).prop("checked");
			// => checked 속성이 존재하지 않지만 체크 상태에 따라 true 또는 false
			
			// 가상선택자 ":checked" 를 활용하여 
			// 해당 체크박스 요소의 속성 중 checked 속성의 체크 여부를 판별
			let is1 = $("input[type=checkbox]").eq(1).is(":checked"); 
			let is2 = $("input[type=checkbox]").eq(2).is(":checked");
			
			// 결과 확인
			$("#result").html(
					"attr1 = " + attr1 + ", prop1 = " + prop1 
					+ "<br>attr2 = " + attr2 + ", prop2 = " + prop2 
					+ "<br>is1 = " + is1 + ", is2 = " + is2);
		});
	});
</script>
</head>
<body>
	<h1>jQuery - test6.jsp</h1>
	<table border="1">
        <tr>
            <th><input type="checkbox" id="allCheck"></th>
            <th>번호</th>
            <th>이름</th>
        </tr>
        <tr>
            <td><input type="checkbox" id="check1" name="check" checked="checked" value="1"></td>
            <td>1</td>
            <td>홍길동</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="2"></td>
            <td>2</td>
            <td>이순신</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check" value="3"></td>
            <td>3</td>
            <td>강감찬</td>
        </tr>
        <tr>
        	<td colspan="3">
        		<input type="button" value="확인" id="btn"><br>
        		<div id="result">결과 확인 위치</div>
        	</td>
        </tr>
    </table>	
</body>
</html>