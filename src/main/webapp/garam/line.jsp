<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>버스 노선 안내</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>

<body class="page10">
        <div class="d01 pd16">
            <div class="tC title"><h2>노선 안내</h2></div>
            <span>정류장을 클릭하면 사진이 나타납니다.</span>
        </div>

        <ul>
            <li class="line">
                <a class="tit">포항대동고등학교 등교 노선</a> 
                <ul id="line2d" class="hide">
                    <li class="line">
                        <a class="tit2">1. 송도/해도/이동</a>
                        <ul class="hide timeline">
                            <li><span>07:35</span><b class="pop-open">송도 해상공원</b><!--b태그 클릭시 팝업 열림-->
                                <div id="Mask"></div><!--팝업오픈시 배경 어둡게-->
                              <!--  pop   -->
                                <div id="pop" class="pop-wrap">
                                  <div class="pop-layer"><!--팝업내용-->
                                     <div class="close"><img src="./img/ico_close.png"></div><!--닫기버튼-->
                                      <div class="imgbox"><img src="./img/testimg.jpg"></div>
                                  </div>
                              </div>
                              <!--  //pop -->
                            </li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="line">
                <a class="tit">포항대동고등학교 등교 노선</a>
                <ul id="line2d" class="hide">
                    <li class="line">
                        <a class="tit2">1. 송도/해도/이동</a>
                        <ul class="hide timeline">
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                        </ul>
                    </li>
                    <li class="line">
                        <a class="tit2">1. 송도/해도/이동</a>
                        <ul class="hide timeline">
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                            <li><span>07:35</span><b>송도 해상공원</b></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>

    <div class="FAB">
        <ul class="ulFl">
            <li><a href="mypage.jsp"><img src="./img/ico01.png"><p>내정보</p></a></li>
            <li><a href="bus.jsp"><img src="./img/ico02.png"><p>버스탑승</p></a></li>
            <li><a href="list.jsp"><img src="./img/ico03.png"><p>이용내역</p></a></li>
        </ul>
    </div>
</body>

</html>

<script>
    jQuery(function ($){
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function(){
            // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
            $(".line>a").click(function(){
                var submenu = $(this).next("ul");
    
                // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if( submenu.is(":visible") ){
                    submenu.slideUp();
                }else{
                    submenu.slideDown();
                }
            });
        });

        $(".pop-open").click(function(){
        $("#pop").show();
        $("#Mask").show();
        });
        $("#pop .close").click(function(){
        $("#pop").hide();
        $("#Mask").hide();
        });
    });

</script>