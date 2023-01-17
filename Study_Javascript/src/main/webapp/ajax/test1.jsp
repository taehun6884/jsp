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
	$("#btnLogin").on("click",function(){
// 		$.ajax({
// 			type: "get",
// 			url: "test1_result.jsp",
// 			data: {
// // 				id: $("#id").val(),
// // 				passwd:$("#passwd").val()
// 				id:"admin",
// 				passwd:"1234"
// 			},
// 			dataType: "text",
// 			success: function(response){ 
// 				$("#resultArea").html(response);
// 			},
// 			error: function(xhr, textStatus, errorThrown) {
// 				$("#resultArea").html("xhr = "+xhr +"<br>textStatus = "+textStatus +"<br>errorThrown = "+errorThrown);
// 			}
			
			let sendData = $("form").serialize();
			$.ajax({
					type: "get",
					url: "http://localhost:8080/MVC_Board/LogintMemberPro.me",
					data:sendData,
					dataType: "text",
					success: function(response){ 
						$("#resultArea").html(response);
					},
					error: function(xhr, textStatus, errorThrown) {
						$("#resultArea").html("xhr = "+xhr +"<br>textStatus = "+textStatus +"<br>errorThrown = "+errorThrown);
					}
		});
	});
 });
</script>
</head>
<body>
	<h1>AJAX - test1.jsp</h1>
	<form action="" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id" required="required" size="20"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd" id="passwd" required="required" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" id="btnLogin">
					<input type="button" value="회원가입" onclick="location.href='MemberInsertForm.me'">
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<div id="resultArea"><!-- AJAX 요청에 대한 응답 처리 결과 출력할 위치 --></div>
	<hr>
</body>
</html>