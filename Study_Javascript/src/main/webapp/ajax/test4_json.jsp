<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function(){
// 		$("#btnOk").on("click",function(){
// 			$.ajax({
// 				type:"get",
// 				url:"tes3_json_data.txt",
// 				dataType:"text",
// 				success: function(msg) {
// 					$("#resultArea").html(msg);
// 				}
// 			});
		
		$("#btnOk").on("click",function(){
// 			$.ajax({
// 				type:"get",
// 				url:"test3_json_data.txt",
// 				dataType:"text",
// 			})
// 			.done(function(msg) {
// 				$("#resultArea").html(msg);
// 			})
// 			.fail(function() {
// 				$("#resultArea").html("요청 실패");
// 			});
			
			// ==============================================================
			
			$.ajax({
				type:"get",
				url:"test4_json_data.txt",
				dataType:"json",
			})
			.done(function(data) {
// 				$("#resultArea").html("<h3>타입: "+typeof(data)+"</h3>");
// 				let strData = JSON.stringify(data);
// 				$("#resultArea").append("<h3>타입: "+typeof(strData)+"</h3>");
// 				$("#resultArea").html(strData);
				$("#resultArea").html("<table border='1' width='700'></table>");
				$("#resultArea > table").append("<tr><th colspan='5'>JSON 데이터 파싱 결과</th></tr>");
				$("#resultArea > table").append("<tr><th>아이디</th><th>이름</th><th>나이</th><th>정보수신동의</th><th>주소</th></tr>");
				
				
				
// 				for(let i = 0;i<data.length;i++){
// 					let id = data[i].id;
// 					let name = data[i].name;
// 					let age = data[i].age;
// 					let agreeRcvSpam = data[i].agreeRcvSpam;
				
// 					$("#resultArea > table").append(
// 							"<tr><td>"+id+"</td><td>"+name+"</td><td>"+age+"</td><td>"+agreeRcvSpam+"</td></tr>"
// 							);
// 				}
				
				for(let i of data){
					let id = i.id;
					let name = i.name;
					let age = i.age;
					let agreeRcvSpam = i.agreeRcvSpam;
					let address = i.address;
					
					$("#resultArea > table").append(
							"<tr><td>"+id+"</td><td>"+name+"</td><td>"+age+"</td><td>"+agreeRcvSpam+"</td><td>"+(address.address1+ " "+address.address2)+"</td></tr>"
							);
				}
			})
			.fail(function() {
				$("#resultArea").html("요청 실패");
			});
			
		});
	});


</script>
</head>
<body>
	<h1>AJAX - test4_json.jsp</h1>
	<input type="button" value="JSON 데이터 파싱" id="btnOk">
	<hr>
	<div id="resultArea"></div>
	
</body>
</html>