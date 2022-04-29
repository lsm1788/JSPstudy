<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

String url = "jdbc:mysql://localhost:3306/garam?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
StringBuffer  qry = new StringBuffer();
qry.append(" SELECT uid, uname, schoolname FROM garam.g_member WHERE uid = ? AND upw = sha1(?) ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

boolean loginSuccess = false;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	conn.prepareStatement(sql);
	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, uid);
	stmt.setString(2, upw);
	rs = stmt.executeQuery();
	
	if(rs.next()){
		session.setAttribute("sessid", rs.getString("uid"));
		session.setAttribute("sessName", rs.getString("uname"));
		session.setAttribute("sessSchName", rs.getString("schoolname"));
		loginSuccess = true;
	}
	
} catch (Exception e) {
	e.getLocalizedMessage();
} finally {
	if(rs != null) rs.close();
	if(conn != null) conn.close();
	if(stmt != null) stmt.close();
}

//페이지 이동
if(loginSuccess){
	response.sendRedirect("mypage.jsp");
} else{
	response.sendRedirect("login.jsp");
}
%>