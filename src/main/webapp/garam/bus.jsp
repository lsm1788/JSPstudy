<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>버스탑승</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page03">
        <div class="c01 pd16">
            <div class="tC title"><h2>버스탑승</h2></div>
            <ul class="ulFl school">
                <li class="on">등교</li>
                <li>하교</li>
            </ul>
        </div>

        <div class="pd16 pdb">
            <div class="mb16 select">
                <img src="./img/img04.png">출발지
                <div class="fR">
                    <select name="start">
                        <option value="">우방비치타운</option>
                        <option value="">포항동부초등학교</option>
                        <option value="">노인복지회관</option>
                    </select>
                    <img src="./img/ico05.png">
                </div>
            </div>

            <div class=" select">
                <img src="./img/img04.png">도착지
                <span class="fR">포항고등학교</span><!--등교 도착지는 학교로 고정-->
            </div>

            <button class="mX mt40" onclick="location.href='qrcode.jsp'">QR Code 실행</button>
        </div>
        
    <div class="FAB">
        <ul class="ulFl">
            <li><a href="mypage.jsp"><img src="./img/ico01.png"><p>내정보</p></a></li>
            <li class="on"><a href="bus.jsp"><img src="./img/ico02_on.png"><p>버스탑승</p></a></li>
            <li><a href="list.jsp"><img src="./img/ico03.png"><p>이용내역</p></a></li>
        </ul>
    </div>
</body>
</html>
