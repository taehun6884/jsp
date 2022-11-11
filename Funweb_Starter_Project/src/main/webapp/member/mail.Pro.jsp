<%@page import="member.GoogleMailAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String sender = request.getParameter("sender");
String receiever = "tgim1456@google.com";
String title = request.getParameter("title ");
String content = request.getParameter("content");

try{
	

Properties properties = System.getProperties();
properties.put("mail.smtp.host", "smtp.gmail.com"); // 서버 주소
properties.put("mail.smtp.auth", "true"); // 인증여부 설정
properties.put("mail.smtp.port", "587"); // 포트 설정

properties.put("mail.smtp.starttls.enable", "true"); // tls 인증 프로토콜을 사용 여부 설정
properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); // tls 인증 프로토콜을 버전 여부 설정

GoogleMailAuthenticator authenticator = new GoogleMailAuthenticator();

Session mailSession = Session.getDefaultInstance(properties, authenticator);

Message mailMessage = new MimeMessage(mailSession);

Address senderAddress = new InternetAddress(sender,sender);

Address receieverAddress = new InternetAddress(receiever);

mailMessage.setHeader("content-type", "text/html; charset=UTF-8");

mailMessage.setFrom(senderAddress);

mailMessage.addRecipient(RecipientType.TO, receieverAddress);

mailMessage.setSubject(title);

mailMessage.setContent(content, "text/html; charset=UTF-8");

mailMessage.setSentDate(new Date());

Transport.send(mailMessage);

%>
	<script type="text/javascript">
		alert("메일 전송 성공!");
		location.href="../main/main.jsp";		
	</script>
<%
}catch(Exception e){
	e.printStackTrace();
	out.println("<h3>smtp 서버 설정 또는 서비스 문제 발생!</h3>");
}

%>
</body>
</html>