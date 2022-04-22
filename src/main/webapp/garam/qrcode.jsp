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
            <div class="qrimg" style="padding:0"><img src="qrcodeImg.jsp" style="width:100%"></div>
            <span>잔여횟수</span>
            <div class="count"><b>4</b>회</div>
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
</body>
</html>
