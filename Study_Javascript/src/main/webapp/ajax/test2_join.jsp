<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function(){
		 $("#id").on("change",function(){
			$.ajax({
				url:"MemberCheckId.me",
				data:{
					id: $("#id").val(),
				},
				success : function(result) {
					if(result == "true"){
						$("#checkIdResult").html("이미 존재 하는 아이디").css("color","red");					
					}else{
						$("#checkIdResult").html("사용 가능한 아이디").css("color","blue");	
					}
				}
			});
		 });
		$("#selectDomain").on("change",function(){
			let domain = $("#selectDomain").val();
			$("#email2").val(domain);
			if(domain == ""){
				$("#email2").attr("readonly",false);
				$("#email2").css("background","white");
				$("#email2").focus();
			}else {
				$("#email2").prop("readonly",true);				
				$("#email2").css("background","lightgray");
			}
		});
	
	
	});
</script>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역(inc/top.jsp 페이지 삽입) -->
<%-- 		<jsp:include page="/inc/top.jsp"></jsp:include> --%>
	</header>
	<h1>회원 가입</h1>
	<form action="" method="post" name="fr">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" required="required" size="20"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남&nbsp;&nbsp;
					<input type="radio" name="gender" value="여" checked="checked">여
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" required="required" size="10">@
					<input type="text" name="email2" id="email2" required="required" size="10">
					<select name="selectDomain" id="selectDomain">
						<option value="">직접입력</option>	
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id"required="required" size="20" placeholder="4-16자리 영문자,숫자 조합">
					<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="password" name="passwd" id="passwd" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합">
					<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>