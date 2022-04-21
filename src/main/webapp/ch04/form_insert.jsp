<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
Home > Person Information
<hr>
<form action="" method="get">
<fieldset style="width:270px">
<legend>개인정보</legend>
이름 : <input name="p_name"><br>
사원코드 : <input name="e_code"><br>
성별 : 
<input type="radio" name="gender">남
<input type="radio" name="gender">여<br>
취미 : <br>
<input type="checkbox" name="hobby1">운동
<input type="checkbox" name="hobby2">독서
<input type="checkbox" name="hobby3">음악감상<br>
언어선택 :
<select name="language">
	<option>선택</option>
	<option>한국어</option>
	<option>중국어</option>
</select>
<hr>
<button type="submit">Login</button>
<button type="reset">Cancel</button>
</fieldset>
</form>
</body>
</html>