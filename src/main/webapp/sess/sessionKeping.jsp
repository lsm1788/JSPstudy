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
String s_id = session.getId();
long lastTime = session.getLastAccessedTime();
long createTime = session.getCreationTime();
out.print("세션아이디 : "+s_id);
out.print("<br>");
out.print("세션 마지막엑세스 시간: "+lastTime/1000);
out.print("<br>");
out.print("세션 생성된 시간: "+createTime/1000);
out.print("<br>");
out.print("세션 유지된 시간: "+(lastTime - createTime)/1000);
%>
</body>
</html>