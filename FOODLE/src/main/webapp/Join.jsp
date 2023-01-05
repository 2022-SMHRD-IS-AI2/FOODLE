<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="JoinCon" method="post">
	ID : <input type="text" name="mb_id" placeholder="아이디"><br>
	PW : <input type="text" name="mb_pw" placeholder="비밀번호"><br>
	PW확인 : <input type="text" name="pwConfirm" placeholder="비밀번호 확인"><br>
	이름 : <input type="text" name="mb_name" placeholder="이름"><br>
	이메일 : <input type="text" name="mb_email" placeholder="email"><br>
	핸드폰번호 : <input type="text" name="mb_phone" placeholder="핸드폰 번호"><br>
	혈액형 : <select name="mb_bloodtype">
				<option>A</option>
                <option>B</option>
                <option>O</option>
                <option>AB</option>
			</select><br>
	키 : <input type="text" name="mb_height" placeholder="키">cm<br>
	몸무게 :  <input type="text" name="mb_weight" placeholder="몸무게">kg<br>
	관심 영양소 :  탄수화물<input type="checkbox" name="recm" value="r_ch">
				단백질<input type="checkbox" name="recm" value="r_pro">
				지방<input type="checkbox" name="recm" value="r_fat">
				당류<input type="checkbox" name="recm" value="r_sugar">
				나트륨<input type="checkbox" name="recm" value="r_sodium">
				콜레스테롤<input type="checkbox" name="recm" value="r_col">
				포화지방산<input type="checkbox" name="recm" value="r_fad">
				트랜스지방산<input type="checkbox" name="recm" value="r_trans">
				
				
	<input type="submit" value="가입하기">
	</form>
</body>
</html>