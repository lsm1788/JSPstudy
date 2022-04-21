<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//스크립트릿
//자바코드
//POST한글깨짐 방지
request.setCharacterEncoding("UTF-8");

String p_id = request.getParameter("p_id");
String p_pw = request.getParameter("p_pw");
String p_name = request.getParameter("p_name");
String choice = request.getParameter("choice");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String gender = request.getParameter("gender");
String [] hobbys = request.getParameterValues("hobby");
String Introduction = request.getParameter("Introduction");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
Home > Person Information
<hr>
<form action="form_membership02.jsp" method="get">
<fieldset style="width:350px">
<legend>개인정보</legend>
아이디 : <%=p_id%><br>
비밀번호 : <%=p_pw%><br>
이름 : <%=p_name%><br>
연락처 : <%=choice%><%=phone1%>-<%=phone2%>-<%=phone3%><br>
성별 : <%=gender%><br>
취미 : <% 
//if(hobbys != null){	
try{
	for(int i = 0; i < hobbys.length; i++){
	out.print(hobbys[i]);	
	}
} catch(Exception e){}
//}
%><br>
<br>
본인소개 : <br>
<%=Introduction %>
<hr>
<button type="submit">Login</button>
<button type="reset">Cancel</button>
</fieldset>
</form>
</body>
</html>