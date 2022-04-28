<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

String lat = request.getParameter("lat");
String lon = request.getParameter("lon");
String uid = (String)session.getAttribute("sessid");

if(session.getAttribute("sessid") == null) {
	response.sendRedirect("login.jsp");
}

String url = "jdbc:mysql://localhost:3306/garam?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM g_location ");
qry.append(" WHERE uid = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, uid);
	rs = stmt.executeQuery();
	
	if(rs.next()){
		updateLoc(conn, stmt, uid, lat ,lon);
	} else{
		createLoc(conn, stmt, uid, lat ,lon);
	}
	
} catch(Exception e){
	e.getLocalizedMessage();
} finally{
	if(rs != null) rs.close();
	if(conn != null) conn.close();
	if(stmt != null) stmt.close();
}

%>
<%!
public void updateLoc(Connection conn, PreparedStatement stmt, String uid, String lat, String lon){
	try{
		
	String sql = "UPDATE g_location SET lat = ?, lon = ? WHERE uid = ? ";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, lat);
	stmt.setString(2, lon);
	stmt.setString(3, uid);
	
	stmt.executeUpdate();
	} catch(Exception e){
		
	}
}
public void createLoc(Connection conn, PreparedStatement stmt, String uid, String lat, String lon){
	try{
		
		String sql = "INSERT INTO g_location (uid, lat, lon) VALUES(?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.setString(2, lat);
		stmt.setString(3, lon);
		
		stmt.executeUpdate();
		} catch(Exception e){
			
		}
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>실시간버스위치</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script>
var lat = <%=lat %>;//위도
var lon = <%=lon %>;//경도
</script>

</head>

<body class="page06">
    <div class="busmap">
<div id="map" style="width:100vw;height:100vh;"></div>
<div style="position:absolute;top:5px;left:5px;z-index:1">뒤로가기</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=719fb44df24352a7a371f686a225fdae"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	sql = " SELECT * FROM g_location ";
	
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
	
	 while(rs.next()){
%>
    {
        title: '<%=rs.getString("uid") %>', 
        latlng: new kakao.maps.LatLng(<%=rs.getString("lat") %>, <%=rs.getString("lon") %>)
    },
<%
	}
} catch(Exception e){
	e.getLocalizedMessage();
} finally{
	if(rs != null) rs.close();
	if(conn != null) conn.close();
	if(stmt != null) stmt.close();
}
%>
];
// 마커 이미지의 이미지 주소입니다
var imageSrc = "img/bustransport_bus_4984.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
        <div class="back"><a href="mypage.jsp"><img src="./img/ico06.png"></a></div> <!--뒤로가기버튼:내정보로 이동-->
    </div>
</body>
</html>
