<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$(":button").on("click",function(){
// 			alert($(":button:focus").val()+ " 버튼 클릭!");
// 		});
		$("button").on("click",function(){
			$("#resultArea").html(
			  	"아이디 : "+$("input[name=id]").val() +"\n"
			  	+ "패스워드 : "+$("input[name=passwd]").val() +"\n"
			  	+"선택 과목 : "+$("selectBox").val() +"\n"
			  	+"선택 과목 : "+$("selectBox > option:selected").val() +"\n"
			);
		});
		$("textarea").on("click",function(){
			alert("textarea 클릭! ");
		});
		
		$("textarea").on("click",function(){
			alert("div 영역 클릭! ");
		});
		
		$("textarea").on("focus",function(){
			$("#resultArea").html("textarea focus in");	
		});
		
		$("textarea").on("blur",function(){
			$("#resultArea").html("textarea focus out");	
		});
		
		
	});
</script>
</head>
<body>
	<h1>jQuery - test7.jsp</h1>
	<div id="wrap">
		<form action="test7_result.jsp">
			<div id="inputBox">
				아이디: <input type="text" name="id">
				패스워드: <input type="password" name="passwd">
			</div>
				<select id="selectBox" name="subject">
				<option value="">선택하세요</option>
				<option value="자바">자바</option>
				<option value="JSP">JSP</option>
				<option value="스프링">스프링</option>
				</select>
				<br>
				<input type="button" value="확인">&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소">
		</form>
	</div>
	<br>
	------------------------
	<div id="clickDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	------------------------
</body>
</html>