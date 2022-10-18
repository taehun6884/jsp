<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 1. ID 중복확인 버튼 클릭 시 새 창(check_id.html) 띄우기
	function checkDuplicateId() {
		// 입력받은 ID 값 가져와서 저장
		let id = document.fr.id.value;
		
		// ID 값에 대한 길이 판별(4 ~ 8글자 사이 여부)
		if(id.length >= 4 && id.length <= 8) { // 유효한 길이일 경우
			// check_id.html 파일을 새 창으로 열고, 
			// id 선택자가 "checkIdResult" 인 span 영역에 "중복확인완료" 출력
			window.open("check_id.html", "checkId", "width=300, height=200");
			document.getElementById("checkIdResult").innerHTML = "중복확인완료";
		} else {
			alert("아이디는 4 ~ 8글자만 사용 가능!");
			document.getElementById("checkIdResult").innerHTML = ""; // 옵션
		}
	}
	
	// 2. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기
	// => 체크 결과를 비밀번호 입력창 우측 빈공간에 표시하기
	// => 비밀번호 길이 체크를 통해 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
    //    아니면, "사용 불가능한 패스워드"(빨간색) 표시
    function checkPasswd(passwd) { // 입력받은 패스워드 전달받기
		// span 태그 영역(checkPasswdResult) 객체 가져오기
		let spanCheckPasswdResult = document.getElementById("checkPasswdResult");
    
    	// 입력된 패스워드 길이 체크
    	if(passwd.length >= 8 && passwd.length <= 16) {
			spanCheckPasswdResult.innerHTML = "사용 가능한 패스워드";
			spanCheckPasswdResult.style.color = "BLUE";    		
    	} else {
    		spanCheckPasswdResult.innerHTML = "사용 불가능한 패스워드";
			spanCheckPasswdResult.style.color = "RED";
    	}
	}
	
	// 3. 비밀번호확인 입력란에 키를 누를때마다 기존 비밀번호와 같은지 체크하기
	// => 체크 결과를 비밀번호확인 입력창 우측 빈공간에 표시하기
	// => 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
    //    아니면, "비밀번호 불일치"(빨간색) 표시
    function checkConfirmPasswd(confirmPasswd) {
		// 패스워드 입력란에 입력된 패스워드 가져오기
		let passwd = document.fr.passwd.value;
		
		// span 태그 영역(checkConfirmPasswdResult) 객체 가져오기
		let spanCheckConfirmPasswdResult = document.getElementById("checkConfirmPasswdResult");
		
		// 두 패스워드 일치 여부 판별
		if(passwd == confirmPasswd) {
			spanCheckConfirmPasswdResult.innerHTML = "패스워드 일치";
			spanCheckConfirmPasswdResult.style.color = "BLUE";    		
		} else {
			spanCheckConfirmPasswdResult.innerHTML = "패스워드 불일치";
			spanCheckConfirmPasswdResult.style.color = "RED";    	
		}
	}
	
	// 4. 주민번호 숫자 입력할때마다 길이 체크하기
	// => 주민번호 앞자리 입력란에 입력된 숫자가 6자리이면 뒷자리 입력란으로 커서 이동시키기
	// => 주민번호 뒷자리 입력란에 입력된 숫자가 7자리이면 뒷자리 입력란에서 커서 제거하기
	function checkJumin1(jumin1) {
		if(jumin1.length == 6) {
			document.fr.jumin2.focus(); // 포커스(커서) 요청
		}
	}
	
	function checkJumin2(jumin2) {
		if(jumin2.length == 7) {
			document.fr.jumin2.blur(); // 포커스(커서) 해제
		}
	}
	
	// 5. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 선택된 셀렉트 박스 값을 
	//    이메일 두번째 항목(@ 기호 뒤 = email2)에 표시하기
	//    단, 직접입력 선택 시 표시된 도메인 삭제하기
	function selectDomain(domain) {
		document.fr.email2.value = domain;
		
		// 만약, "직접입력" 항목 외의 도메인 선택 시 도메인 입력창(email2) 잠금
		// 아니면, "직접입력" 항목 선택 시 도메인 입력창(email2)에 커서 요청하고, 잠금 해제
		if(domain != "") {
// 			document.fr.email2.disabled = true; // 입력창 비활성화(임시)
			// => 주의! form 데이터 전송(submit) 시 데이터 전달되지 않음
			// => readOnly 속성을 통해 입력창 잠금 후에도 데이터 사용 가능하도록 할 수 있다!
			document.fr.email2.readOnly = true; // 입력창 입력 비활성화(읽기 전용)
		} else {
// 			document.fr.email2.disabled = false; // 입력창 활성화(임시)
			document.fr.email2.readOnly = false; // 입력창 입력 비활성화(임시)
			document.fr.email2.focus();
		}
	}
	
	// 6. 취미의 "전체선택" 체크박스 체크 시 취미 항목 모두 체크, 
	//    "전체선택" 해제 시 취미 항목 모두 체크 해제하기
	function checkAll(checked) {
		// 전체선택 체크 항목값(checked) 에 따라 각 항목 체크 또는 체크 해제
// 		if(checked) {
// 			document.fr.hobby[0].checked = true;
// 			document.fr.hobby[1].checked = true;
// 			document.fr.hobby[2].checked = true;
// 		} else {
// 			document.fr.hobby[0].checked = false;
// 			document.fr.hobby[1].checked = false;
// 			document.fr.hobby[2].checked = false;
// 		}
		
		// for...of 문을 사용하여 체크박스 배열 항목을 각각 꺼내서 가져온 뒤
		// 전체선택 체크박스 체크 상태를 그대로 각 체크박스에 적용
		for(hobby of document.fr.hobby) {
			hobby.checked = checked;
		}
	}
</script>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="insertPro2.jsp" name="fr" method="post">
		<table border="1">
			<tr><td>이름</td><td><input type="text" name="name" required="required"></td></tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력" required="required">
					<input type="button" value="ID중복확인" onclick="checkDuplicateId()">
					<span id="checkIdResult"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd" onkeyup="checkPasswd(this.value)" 
						placeholder="8 ~ 16글자 사이 입력" required="required">
					<span id="checkPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2" 
						onkeyup="checkConfirmPasswd(this.value)" required="required">
					<span id="checkConfirmPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" 
						onkeyup="checkJumin1(this.value)" required="required"> -
					<input type="password" name="jumin2" 
						onkeyup="checkJumin2(this.value)" required="required">
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" required="required">@
					<input type="text" name="email2" required="required">
					<select name="emailDomain" onchange="selectDomain(this.value)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job" required="required">
						<option value="">항목을 선택하세요</option>
						<option value="개발자">개발자</option>
						<option value="DB엔지니어">DB엔지니어</option>
						<option value="관리자">관리자</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="게임">게임
					<!-- 전체선택 체크박스 클릭 시 체크 상태(true, false)를 함수에 전달(함수 이름과 name 속성 다르게!) -->
					<input type="checkbox" name="check_all" value="전체선택" 
						onclick="checkAll(this.checked)">전체선택
				</td>
			</tr>
			<tr>
				<td>가입동기</td>
				<td><textarea name="content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>












