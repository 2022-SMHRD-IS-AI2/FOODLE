<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/all_style.css">
    <link rel="stylesheet" href="css/login_style.css">
</head>
<body>
	여긴 로그인
	<form action="LoginCon" method="post">
	<div class = "wrap">
        <img src = "img/l_bg.jpg">

        <div id="box">
            <div id="box1">
                <img src="img/logo.png">
            </div>
            <div class="boxWrap">
                <div id="box2">
                    <input class="login_input pl10" type="text" name="id" placeholder="Username" autofocus>
                </div>
                <div id="box3">
                    <input class="login_input pl10" type="password" name="pw" placeholder="****" maxlength="10">
                </div>
                <div id="box4">
                    <input type="submit" value="로그인" class="main_btn">
	</form>
					<input type="reset" value="회원가입" class="main_btn">
                   
                </div>
            </div>
        </div>


        </div>

</body>
</html>