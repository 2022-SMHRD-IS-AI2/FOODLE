<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="css/all_style.css">
    <link rel="stylesheet" href="css/weight_style.css">
</head>
<body>
<%
    MemberVO client = (MemberVO)session.getAttribute("client");
	
    String name = client.getMb_name();
    String gender = client.getMb_gender();
    String height = client.getMb_height();
    String weight = client.getMb_weight();
    String choosenut = client.getMb_fav_ingredient();
    // System.out.print(name);
    
  %>



    <div class="wrapper">
        <!--Top menu -->
        <div class="sidebar">
           <!--profile image & text-->
            <!--menu item-->
            <div class="profile">
                <br>
                <h1>FOODER</h1> <br>
                <h3><%=name %></h3> <br>
                <div class = "p_1"><a>성별    <%=gender %></a></div>
				<div class = "p_1"><a>신장    <%=height %> cm</a></div>
				<div class = "p_1"><a>몸무게    <%=weight %> kg</a></div>
            </div>
            <div class="search">
                <input type="text" placeholder="검색어를 입력해주세요.">
            </div>
            <ul>
                <li>
                    <a href="main.jsp" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="change.jsp">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">회원 정보 조회 / 수정</span>
                    </a>
                </li>
                <li>
                    <a href="AllChartCon">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">Dash board</span>
                    </a>
                </li>
                <li>
                    <a href="weight.jsp">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">몸무게 기록</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div id="fullscreen">
        <div id="screen0"></div>

        <div>
       <div id="date">
            <input type="date">
        </div>
        <div id="text">
            <input type="text" placeholder="체중을 입력해주세요.">
        </div>
                
        <!-- <button class="btn1" type="button"><img src="./img/button1.png"></button> -->
        <button class="btn1" type="button"> 제출 </button>
        </div>

          
           <div id="screen1-0">
           <h1 id = "head">2023.01.16 ~ 2023.01.22 <!-- *** 표현식으로 바꿔주세요! -->
           				   <br>몸무게 변화</h1>
            <div id="screen1-1">
            <canvas id="2-2" width = "1500px" height="600px"></canvas>
			<script> 
			    new Chart(document.getElementById("2-2"), {
			    type: 'line',
			    data: {
			      labels: ["1/16", "1/17", "1/18", "1/19", "1/20", "1/21", "1/22"] , /* !! 표현식으로 바꿔주세요!!*/
			      datasets: [{ 
			          data: [50, 52, 53, 54, 55, 56, 58], /* !! 표현식으로 바꿔주세요!!*/
			          label: "몸무게",
			          borderColor: "#3e95cd",
			          fill: false
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '주간 몸무게 그래프'
			      }
			    }
			  });
			</script>
            </div>
           
        </div>
        </div>>



</body>
</html>