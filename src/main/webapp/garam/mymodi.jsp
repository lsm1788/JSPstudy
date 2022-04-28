<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("sessid") == null) {
	response.sendRedirect("login.jsp");
}

String url = "jdbc:mysql://localhost:3306/garam?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM g_member ");
qry.append(" WHERE uid = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String uName = "";
String schoolName = "";
String phone = "";
String gradeClass= "";
String route = "";
String boardingPlace = "";


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, (String)session.getAttribute("sessid"));
	rs = stmt.executeQuery();
	
	if(rs.next()){
		uName = rs.getString("uName");
		schoolName = rs.getString("schoolname");
		phone = rs.getString("uid");
		gradeClass= rs.getString("gradeclass");
		route = rs.getString("route");
		boardingPlace = rs.getString("boardingplace");

	}
	
} catch(Exception e){
	e.getLocalizedMessage();
} finally{
	if(rs != null) rs.close();
	if(conn != null) conn.close();
	if(stmt != null) stmt.close();
}

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원수정</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
    <div class="jointit w100 tC"><b>회원수정</b></div>

    <div class="pd16">
		<form method="post" action="mymodiAct.jsp" >
		<input type="hidden" name="uid" id="uid" value="<%=session.getAttribute("sessid") %>">
	        <div>
	            <h4>이름</h4>
	            <input type="text" id="uname" name="uname" value="<%=uName %>" maxlength="6">
	        </div>
	
	        <div>
	            <h4>학교</h4>
	            <input type="text" id="schoolname" name="schoolname" value="<%=schoolName %>">
	        </div>
	
	        <div>
	            <h4>학년/반</h4>
	            <input type="text" id="grade" name="gradeclass" value="<%=gradeClass %>">
	        </div>
	       	
	        <div>
	            <h4>노선</h4>
	            <div class="sltbox">
	                <select id="road" name="route">
	                    <option value="A노선" <%="A노선".equals(route)?"selected":"" %>>A노선</option>
	                    <option value="B노선" <%="B노선".equals(route)?"selected":"" %>>B노선</option>
	                    <option value="C노선" <%="C노선".equals(route)?"selected":"" %>>C노선</option>
	                </select>
	            </div>
	        </div>
	        
	        <div>
	            <h4 class="inline">탑승장소</h4> <span>(※노선을 먼저 선택해주세요)</span>
	            <div class="sltbox">
	                <select id="place" name="boardingplace">
	                    <option value="A장소" <%="A노선".equals(boardingPlace)?"selected":"" %>>A장소</option>
	                    <option value="B장소" <%="B노선".equals(boardingPlace)?"selected":"" %>>B장소</option>
	                    <option value="C장소" <%="C노선".equals(boardingPlace)?"selected":"" %>>C장소</option>
	                </select>
	            </div>
	        </div>
	        
	        <div class="jw100 tC">
	            <button id="btn" type="submit">수정완료</button>
	        </div>
        </form>
    </div>

<script>
function chkName(str){
	var nameCheck = /^[가-힣]{2,6}$/;
	if(!nameCheck.test(str)){
		return false;
	}
	return true;
}

//유효성 검사
$(document).ready(function(){
	$('#btn').click(function(){
		
		if($('#uname').val() == 0){
			alert("이름을 입력하세요");
			$('#uname').focus();
			return false;
		}		
		if(!chkName($('#uname').val())){
			console.log("잘못됨"+$('#uname').val());
			alert("올바른 형식의 이름을 입력하세요");
			$('#uname').val('');
			$('#uname').focus();
			return false;
		}
		
		if($('#schoolname').val() == 0){
			alert("학교명을 입력하세요");
			$('#schoolname').focus();
			return false;
		}
		
		if($('#grade').val() == 0){
			alert("학년/반을 입력하세요");
			$('#grade').focus();
			return false;
		}
	});
//휴대폰번호 벨류값 넘겨주기	
	$('button[type=submit]').on('click', function(){

		return true;
	});

});
</script>
</body>
</html>
