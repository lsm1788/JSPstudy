<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String agree = request.getParameter("agree");
	String method = request.getMethod();	//get 인지 post인지 확인
	
	if((agree == null || !"Y".equals(agree)) || method.equals("GET")){
%>
<script>
	history.go(-1);
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입<%=method %></title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page07">
    <div class="jointit w100 tC"><b>회원가입</b></div>

    <div class="pd16">
		<form method="post" onsubmit="return join02()" action="join02Act.jsp" >
		<input type="hidden" name="uid" id="uid">
	        <div>
	            <h4>이름</h4>
	            <input type="text" id="uname" name="uname" maxlength="6">
	        </div>
	
	        <div>
	            <h4>학교</h4>
	            <input type="text" id="schoolname" name="schoolname" placeholder="ex) 포항고 or 포항고등학교"
	            onfocus="this.placeholder=''" onblur="this.placeholder='ex) 포항고 or 포항고등학교'">
	        </div>
	
	        <div>
	            <h4>학년/반</h4>
	            <input type="text" id="grade" name="gradeclass" placeholder="ex) 2학년1반"
	            onfocus="this.placeholder=''" onblur="this.placeholder='ex) 2학년1반'">
	        </div>
	
	        <div class="pnum">
	            <div><h4 class="inline">휴대폰번호</h4> <span>(※휴대폰 번호가 ID로 설정됩니다.)</span></div>
	            <input type="text" maxLength="3" id="phone1">-
	            <input type="text" maxLength="4" id="phone2">-
	            <input type="text" maxLength="4" id="phone3">
	        </div>
	
	        <div>
	            <h4 class="inline">비밀번호</h4> <span>(※최소8자리,하나이상의 문자와숫자포함)</span>
	            <input type="password" maxlength='20' id="pw" name="upw">
	        </div>
	
	        <div>
	            <h4>비밀번호 확인</h4>
	            <input type="password" id="pw2" maxlength='20'>
	            <label>
					<input type="checkbox" id="pwChk" style="margin-top: 10px;"> 비밀번호 표시
					<img src="./img/eye.png" height="26" width="23" style="margin-top: 9px;">
				</label>
	        </div>
	
	        <div>
	            <h4>노선</h4>
	            <div class="sltbox">
	                <select id="road" name="route">
	                    <option value="A노선">A노선</option>
	                    <option value="B노선">B노선</option>
	                    <option value="C노선">C노선</option>
	                </select>
	            </div>
	        </div>
	        
	        <div>
	            <h4 class="inline">탑승장소</h4> <span>(※노선을 먼저 선택해주세요)</span>
	            <div class="sltbox">
	                <select id="place" name="boardingplace">
	                    <option value="A장소">A장소</option>
	                    <option value="B장소">B장소</option>
	                    <option value="C장소">C장소</option>
	                </select>
	            </div>
	        </div>
	        
	        <div class="jw100 tC">
	            <button id="btn" type="submit">가입하기</button>
	        </div>
        </form>
    </div>

<script>
//이름 정규식
function chkName(str){
	var nameCheck = /^[가-힣]{2,6}$/;
	if(!nameCheck.test(str)){
		return false;
	}
	return true;
}
//학교명 정규식
function chkSchool(str){
	var schoolChk = /^[가-힣]{3,10}$/;
	if(!schoolChk.test(str)){
		return false;
	}
	return true;
}
//학년 반 정규식
function chkGrade(str){
	var gradelChk = /^[가-힣|0-9|]{3,10}$/;
	if(!gradelChk.test(str)){
		return false;
	}
	return true;
}

//휴대폰번호 정규식
function chkPnum(a){
	var pnumCheck1 = /^01([0|1|6|7|8|9])$/;
	if(!pnumCheck1.test(a)){
		return false;
	}
	return true;
}
//휴대폰번호 정규식
function chkPnum2(b){
	var pnumCheck2 = /^([0-9]{3,4})$/;
	if(!pnumCheck2.test(b)){
		return false;
	}
	return true;
}
//휴대폰번호 정규식
function chkPnum3(c){
	var pnumCheck3 = /^([0-9]{4})$/;
	if(!pnumCheck3.test(c)){
		return false;
	}
	return true;
}
//비밀번호 정규식
function chkPassword(pw){
	var pwFormula = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	if(!pwFormula.test(pw)){
		return false;
	}
	return true;
}
	
	

//비밀번호 표시
$(function(){
	$('#pwChk').on('click', function(){
		$('#pw').toggleClass('active');
		if($('#pw').hasClass('active')){
			$('#pw').prop('type', 'text');
			$('#pw2').prop('type', 'text');
		} else {
			$('#pw').prop('type', 'password');
			$('#pw2').prop('type', 'password');
		}
	});
});
//휴대폰번호 자리 포커스
$("#phone1").on("keyup",function(){ 
	if(this.value.length == 3){ 			
		$("#phone2").focus(); 
		
	} 
});	
$("#phone2").on("keyup",function(){ 
	if(this.value.length == 4){ 
		$("#phone3").focus(); 
	} 
});
$("#phone3").on("keyup",function(){ 
	if(this.value.length == 4){ 
		$("#pw").focus(); 
	} 
});

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
		if(!chkSchool($('#schoolname').val())){
			console.log("잘못됨"+$('#schoolname').val());
			alert("정확한 학교명을 입력하세요");
			$('#schoolname').val('');
			$('#schoolname').focus();
			return false;
		}
		
		if($('#grade').val() == 0){
			alert("학년/반을 입력하세요");
			$('#grade').focus();
			return false;
		}
		
		if(!chkGrade($('#grade').val())){
			console.log("잘못됨"+$('#grade').val());
			alert("정확한 학년/반을 입력하세요");
			$('#grade').val('');
			$('#grade').focus();
			return false;
		}
		
		if(($('#phone1').val() == 0)){
			alert("휴대폰번호를 입력하세요");
			$('#phone1').focus();
			return false;
		}
		
		if(!chkPnum($('#phone1').val())){
			console.log("잘못됨"+$('#phone1').val());
			alert("정확한 휴대폰 번호를 입력하세요");
			$('#phone1').val('');
			$('#phone1').focus();
			return false;
		}
		if(!chkPnum2($('#phone2').val())){
			console.log("잘못됨"+$('#phone2').val());
			alert("정확한 휴대폰 번호를 입력하세요");
			$('#phone2').val('');
			$('#phone2').focus();
			return false;
		}
		if(!chkPnum3($('#phone3').val())){
			console.log("잘못됨"+$('#phone3').val());
			alert("정확한 휴대폰 번호를 입력하세요");
			$('#phone3').val('');
			$('#phone3').focus();
			return false;
		}
		if($('#pw').val() == 0){
			alert("비밀번호를 입력하세요");
			$('#pw').focus();
			return false;
		}
		if(!chkPassword($('#pw').val())){
			console.log("잘못됨"+$('#pw').val());
			alert("비밀번호 최소8자리, 하나이상의 문자와숫자를 입력하세요");
			$('#pw').val('');
			$('#pw').focus();
			return false;
		}
		
		if($('#pw2').val() == 0){
			alert("비밀번호확인을 입력하세요");
			$('#pw2').focus();
			return false;
		}
		
		if($('#pw').val() != $('#pw2').val()){
			alert('비밀번호가 일치하지않습니다.');
			$('#pw').val('');
			$('#pw2').val('');
			$('#pw').focus();
			return false;
		}
	});
//휴대폰번호 벨류값 넘겨주기	
	$('button[type=submit]').on('click', function(){
		var p1 = $('#phone1').val();
		var p2 = $('#phone2').val();
		var p3 = $('#phone3').val();
		$('#uid').val(p1+p2+p3);
		return true;
	});

});
</script>
</body>
</html>
