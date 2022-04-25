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
String u_id = (String)session.getAttribute("memberId");
String u_pw = (String)session.getAttribute("memberPw");

out.print("아이디 : "+u_id+", ");
out.print("비밀번호 :"+u_pw);
%>
</body>
</html>