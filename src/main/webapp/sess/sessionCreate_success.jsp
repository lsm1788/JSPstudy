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
String u_id = request.getParameter("id");
String u_pw = request.getParameter("passwd");

if(u_id.equals("space") && u_pw.equals("123456")){
	//로그인성공시 세션변수 생성
	session.setAttribute("memberId", u_id);
	session.setAttribute("memberPw", u_pw);
	
	out.println("세션생성 성공!");
} else{
	out.println("세션생성 실패!");
	//로그인실패시 이전페이지로 이동
}
%>
</body>
</html>