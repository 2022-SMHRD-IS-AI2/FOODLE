<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	여긴 로그인
	<form action="LoginCon" method="post">
	ID : <input type="text" name="ID" placeholder="ID">
	PW : <input type="text" name="PW" placeholder="PW">
	<input type="submit" value="로그인">
	</form>
	<a href="Join.jsp"><button>회원가입</button></a>
</body>
</html>