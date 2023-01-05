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
	ID : <input type="text" name="id" placeholder="아이디"><br>
	PW : <input type="text" name="pw" placeholder="비밀번호"><br>
	PW확인 : <input type="text" name="pwConfirm" placeholder="비밀번호 확인"><br>
	이름 : <input type="text" name="name" placeholder="이름"><br>
	이메일 : <input type="text" name="email" placeholder="email"><br>
	핸드폰번호 : <input type="text" name="Mphone" placeholder="핸드폰 번호"><br>
	자택번호 : <input type="text" name="Hphone" placeholder="자택 번호"><br>
	혈액형 : <select>
				<option>A형</option>
                <option>B형</option>
                <option>O형</option>
                <option>AB형</option>
			</select><br>
	키 : <input type="text" name="height" placeholder="키">cm<br>
	몸무게 :  <input type="text" name="weight" placeholder="몸무게">kg<br>
	관심 영양소 :  탄수화물<input type="checkbox" name="inter" value="ch">
				단백질<input type="checkbox" name="inter" value="pro">
				지방<input type="checkbox" name="inter" value="fat">
				당류<input type="checkbox" name="inter" value="sugar">
				나트륨<input type="checkbox" name="inter" value="na">
				콜레스테롤<input type="checkbox" name="inter" value="col">
				포화지방산<input type="checkbox" name="inter" value="fad">
				트랜스지방산<input type="checkbox" name="inter" value="trans">
				
	<input type="submit" value="가입하기">
	</form>
</body>
</html>