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
    <link rel="stylesheet" href="css/search_style.css">
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
                <tr>
                    <td>GENDER</td>
                    <td>man</td> <br>
                    <td>HEIGHT</td>
                    <td>185</td> <br>
                    <td>WEIGHT</td>
                    <td>90</td>
                </tr>
            </div>
            <div class="search">
                <input type="text" placeholder="검색어를 입력해주세요">
                <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>
            <ul>
                <li>
                    <a href="#" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">회원 정보 조회 / 수정</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">몸무게 기록</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div id="fullscreen">
        <!-- <div id="screen0"></div> -->
        <div id="screen">
            <div class="search">
                <input type="text" placeholder="검색어를 입력해주세요">
                <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>
            <!-- <div id="screen-1">
            </div> -->
        </div>
        <div id="screen1">
        	<canvas id="1-1" width = "700px" height="570px"></canvas>
		
			<script> 
			    new Chart(document.getElementById("1-1"), {
			    type: 'bar',
			    data: {
			      labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)" ] ,
			      datasets: [{ 
			          data: [60, 20, 32, 50, 70, 90],
			          label: "일일영양분",
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
            <!-- <div id="screen1-1">
            </div> -->
            <!-- <div id="screen1-2">
            </div> -->
            <!-- <div id="screen1-3">
            </div> -->
        </div>
        <div id="screen2">
            <table>
                <tr>
                    <td colspan="2"  class="name">식품이름</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td  class="name">1회제공량(g)</td>
                    <td></td>
                    <td  class="name">당류(g)</td>
                    <td></td>
                </tr>
                <tr>
                    <td  class="name">열량(kcal)</td>
                    <td></td>
                    <td  class="name">나트륨(mg)</td>
                    <td></td>
                </tr>
                <tr>
                    <td  class="name">탄수화물(g)</td>
                    <td></td>
                    <td  class="name">콜레스테롤(mg)</td>
                    <td></td>
                </tr>
                <tr>
                    <td  class="name">단백질(g)</td>
                    <td></td>
                    <td  class="name">포화지방산(g)</td>
                    <td></td>
                </tr>
                <tr>
                    <td  class="name">지방(g)</td>
                    <td></td>
                    <td  class="name">트랜스지방산(g)</td>
                    <td></td>
                </tr>
            </table>
            <!-- <div id="screen2-1">
            </div> -->
            <!-- <div id="screen2-2">
            </div> -->
            <!-- <div id="screen2-3">
            </div> -->
            <!-- <div id="screen2-4">
            </div> -->
        </div>
    </div>

</body>
</html>