<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:mysql://localhost:3306/garam?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT coupon FROM g_member ");
qry.append(" WHERE uid = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, (String)session.getAttribute("sessid"));
	rs = stmt.executeQuery();
	
	if(rs.next()){
		out.print(rs.getString("coupon"));
	}
	
} catch(Exception e){
	e.getLocalizedMessage();
} finally{
	if(rs != null) rs.close();
	if(conn != null) conn.close();
	if(stmt != null) stmt.close();
}

%>