<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#name").on("keyup",function(){
// 			$("#nameResult").html($("#name").val());
			let name = $("#name").val();
			let regex = /^[가-힣]{2,10}$/;
// 			alert(regex," : ", typeof(regex));
			
			if(!regex.exec(name)){
				$("#nameResult").html("이름이 올바르지 않습니다!").css("color","red");
			}else {
				$("#nameResult").html("좋은이름이네요").css("color","blue");
			}
		});
		
		$("#id").on("change",function(){
			let id = $("#id").val();
			
			let lengthRegex = /^[A-Za-z0-9!-_.]{8,16}$/;
			
			if(!lengthRegex.exec(id)){
				$("#idResult").html("아이디 올바르지 않습니다!").css("color","red");
			}else {
				$("#idResult").html("good!").css("color","blue");
			}
		});
		
		$("#passwd").on("change",function(){
			let passwd = $("#passwd").val();
			
			let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
			
			let engUpperRegex = /[A-Z]/;
			let engLowerRegex = /[a-z]/;
			let numRegex = /[0-9]/;
			let specUpperRegex = /[!@#$%]/;
			
			if(!lengthRegex.exec(passwd)){
				$("#passwdResult").html("패스워드 올바르지 않습니다!").css("color","red");
			}else {
// 				$("#passwdResult").html("good!").css("color","blue");

				let count = 0;
				
				if(engUpperRegex.exec(passwd)){
					count++
				};
				if(engLowerRegex.exec(passwd)){
					count++
				};
				if(numRegex.exec(passwd)){
					count++
				};
				if(specUpperRegex.exec(passwd)){
					count++
				};
				
				switch(count){
					case 4 : $("#passwdResult").html("안전").css("color","green"); break;
					case 3 : $("#passwdResult").html("보통").css("color","orange"); break;
					case 2 : $("#passwdResult").html("위험").css("color","yellow"); break;
					case 1 : $("#passwdResult").html("사용불가").css("color","red"); break;
				}
				
				
			}
		});
	});

</script>
</head>
<body>
	<h1>정규 표현식 - test1.jsp</h1>
	<input type="text" id="name" placeholder="이름(한글자 2~10글자)">
	<span id="nameResult"></span>
	<br>
	<input type="text" id="id" placeholder="아이디(영문,숫자,특수문자8~16자)">
	<span id="idResult"></span>
	<br>
	<input type="text" id="passwd" placeholder="비밀번호(영문,숫자,특수문자8~16자)">
	<span id="passwdResult"></span>
	<br>
	
	
</body>
</html>