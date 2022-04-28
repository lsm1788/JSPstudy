<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 


request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String uname = request.getParameter("uname");
String schoolname = request.getParameter("schoolname");
String gradeclass = request.getParameter("gradeclass");
String route = request.getParameter("route");
String boardingplace = request.getParameter("boardingplace");

//JDBC프로그래밍
String url = "jdbc:mysql://localhost:3306/garam?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
StringBuffer qry = new StringBuffer();
qry.append(" UPDATE g_member SET uname = ?, schoolname = ?, gradeclass = ?, route = ?, boardingplace = ? ");
qry.append(" WHERE uid = ? ");

String sql = qry.toString();
Connection conn = null;
PreparedStatement stmt = null;
int res = 0;
//드라이버 로드
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, uname);
	stmt.setString(2, schoolname);
	stmt.setString(3, gradeclass);
	stmt.setString(4, route);
	stmt.setString(5, boardingplace);
	stmt.setString(6, uid);
	
	res = stmt.executeUpdate();
} catch(Exception e){
	e.getLocalizedMessage();
} finally {
	//닫기
	if(stmt != null) stmt.close();
	if(conn != null) stmt.close();
}
%>
<script>
<%
if(res <= 0){
%>
	alert("회원수정이 실패했습니다.");
	history.go(-1);
<%
} else {
%>
	location.href="logout.jsp";
<%
}
%>
</script>


