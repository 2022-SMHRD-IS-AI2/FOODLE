<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/main_style.css">
</head>

<body>
  <div class = "wrap">
    <img src="img/back2.jpg">
     <%if(session.getAttribute("client") == null) { %>
     <a href = "login.jsp">
      <button class="btn1" type="button"> 로그인 </button></a>
     <a href="Join.jsp">
      <button class="btn2" type="button"> 회원가입 </button>
     </a>
      <%} else { %>
      <a href = "AllChartCon">
      <button class="btn1" type="button"> 대시보드 </button></a>
      <a href = "LogoutCon">
      <button class="btn2" type="button"> 로그아웃 </button></a>
      <%} %>
  
    
      <span class="ments1">
        지금이 아니면 만날 수 없는,
        <br>
        어디에도 없는 오늘의 나를 위해
      </span>

      <span class="ments2"> 2030 세대를 위한 1:1 푸드 컨설팅 웹 </span>
   
    <div class = "m_logo">
      <img src="img/logo.png">
     
  
        
     
    </div>
  </div>

</body>
</html>