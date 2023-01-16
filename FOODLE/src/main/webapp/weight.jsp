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



    <div class="wrapper">
        <!--Top menu -->
        <div class="sidebar">
           <!--profile image & text-->
            <!--menu item-->
            <div class="profile">
                <br>
                <h1>FOODER</h1> <br>
                <h3>김진수</h3> <br>
                <!-- <tr>
                    <td>성별</td>
                    <td>man</td> <br>
                    <td>키</td>
                    <td>185</td> <br>
                    <td>몸무게</td>
                    <td>90</td>
                </tr> -->
                <div class = "p_1"><a>성별    </a></div>
				<div class = "p_1"><a>신장     cm</a></div>
				<div class = "p_1"><a>몸무게    kg</a></div>
            </div>
            <div class="search">
                <input type="text" placeholder="검색어를 입력해주세요">
                <a href ="search.jsp"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></a>
            </div>
            <ul>
                <li>
                    <a href="main.jsp" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="AllChartCon">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="change.jsp">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">회원 정보 조회 / 수정</span>
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
           <h1 id = "head">2023.01.13 ~ 2023.01.20 <!-- *** 표현식으로 바꿔주세요! -->
           				   <br>몸무게 변화</h1>
            <div id="screen1-1">
            <canvas id="2-2" width = "1500px" height="600px"></canvas>
			<script> 
			    new Chart(document.getElementById("2-2"), {
			    type: 'line',
			    data: {
			      labels: [1,2,3,4,5,6,7,8] ,
			      datasets: [{ 
			          data: [60, 20, 32, 50, 70, 90, 70, 88],
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