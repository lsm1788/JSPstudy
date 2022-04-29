<%@page import="java.util.Date"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page05 tC">
    <div class="mXY">
        <div class="qrcode">
            <div class="qrimg" style="padding:0">
<%

String savedFileName = "";
String qrMsg = new Date().toString();//"{'name':'안명진'}";
//한글깨짐방지
String data = new String(qrMsg.getBytes("UTF-8"), "ISO-8859-1");

File path = new File(application.getRealPath("/") + "garam/qrImages/");
savedFileName = UUID.randomUUID().toString().replace("-", "");

//폴더생성
if(!path.exists()) path.mkdir();

//폴더속 파일삭제
File[] delFile = path.listFiles();
if(delFile != null){
   for(int i = 0; i < delFile.length; i++){
      delFile[i].delete();
   }
}

QRCodeWriter writer = new QRCodeWriter();
BitMatrix qrCode 
         = writer.encode(data, BarcodeFormat.QR_CODE, 200, 200);
BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);

File file = new File(path, savedFileName+".png");

ImageIO.write(qrImage, "PNG", file);
%>
            <img src="<%=request.getContextPath()+"/garam/qrImages/"+savedFileName+".png" %>">
         </div>
            <span>잔여횟수</span>
            <div class="count"><b id="txtHint">4</b>회</div>
        </div>
        <img src="./img/logo_bt.png" class="mt40">
    </div>
    
    <div class="FAB">
        <ul class="ulFl">
            <li><a href="mypage.jsp"><img src="./img/ico01.png"><p>내정보</p></a></li>
            <li class="on"><a href="02_bus.jsp"><img src="./img/ico02_on.png"><p>버스탑승</p></a></li>
            <li><a href="list.jsp"><img src="./img/ico03.png"><p>이용내역</p></a></li>
        </ul>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
setTimeout(function coupon(){

	$.ajax({ url: "getCoupon.jsp", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		//data: { name: "홍길동" }, // HTTP 요청과 함께 서버로 보낼 데이터 
		method: "GET", // HTTP 요청 메소드(GET, POST 등) 
		dataType: "text" // 서버에서 보내줄 데이터의 타입
	}) 
	// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. 
	.done(function(text) { 
		$("#txtHint").text(text); 
	}) 
	// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
	.fail(function(xhr, status, errorThrown) { 
		$("#txtHint").text("오류가 발생했다"); 
	}) // done or fail 을 무시하고 항상 수행.
	// 
	.always(function(xhr, status) { 
		//$("#txtHint").html("요청이 완료되었습니다!"); 
	});

   
   setTimeout(coupon, 1000);
},1000);
</script>    
</body>
</html>


