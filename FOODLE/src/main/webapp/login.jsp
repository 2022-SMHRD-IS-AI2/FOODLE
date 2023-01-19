<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/all_style.css">
    <link rel="stylesheet" href="css/login_style.css">
    
<%-- 	<%String fail = (String)session.getAttribute("fail"); %>
	<% if(fail == null) {fail = "notFail";}%> --%>
	

</head>
<body>

    <div class = "wrap">
    <img src="img/back2.jpg">

<form action="LoginCon" method="post">
        <div id="box">
            <div class="box_bg">
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
                    
                   <%--  <% if(fail.equals("fail")) { %>
                    
                    		<span style="color:red"> 로그인에 실패하셨습니다. </span> 
                    	
                    <% } %> --%>
                    
                    <div id="box4" align="center">
                        <input type="submit" value="로그인" class="main_btn"> 
                        
                    </div>
                </div>
            </div>
        </div>
</form>
		


    </div>
</body>
</html>