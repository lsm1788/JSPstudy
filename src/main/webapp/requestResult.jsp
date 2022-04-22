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
out.print(request.getContextPath()+"V<br>");	//중요

out.print(request.getLocalAddr()+"<br>");
out.print(request.getLocalName()+"<br>");
out.print(request.getLocalPort()+"<br>");
out.print(request.getLocale()+"<br>");

out.print(request.getMethod()+"V<br>");			//중요
out.print(request.getQueryString()+"V<br>");	//중요
out.print(request.getParameter("name")+"V<br>");	//중요
out.print(request.getRemoteAddr()+"V<br>");			//중요//IP주소 알아낼 때

out.print(request.getRequestURI()+"<br>");
out.print(request.getRequestURL()+"<br>");
out.print(request.getHeader("referer")+"<br>");
%>
</body>
</html>