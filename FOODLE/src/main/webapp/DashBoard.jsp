<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>Document</title>
<link rel="stylesheet" href="css/all_style.css">
<link rel="stylesheet" href="css/DashBoard_style.css">
</head>
<body>
	<%
    MemberVO client = (MemberVO)session.getAttribute("client");
    String name = client.getMb_name();
    String gender = client.getMb_gender();
    String height = client.getMb_height();
    String weight = client.getMb_weight();
       System.out.print(name);
    
 	// 2-3 :  검색식품 영양 성분 그래프 값(임시)
    int ww =80;
    
    %>

	<div class="wrapper">
		<!--Top menu -->
		<div class="sidebar">
			<!--profile image & text-->
			<!--menu item-->
			<div class="profile">
				<br>
				<h1>FOODER</h1>
				<br>
				<h3><%=name %></h3>
				<br>
				<tr>
					<td>GENDER</td>
					<td><%=gender %></td>
					<br>
					<td>HEIGHT</td>
					<td><%=height %></td>
					<br>
					<td>WEIGHT</td>
					<td><%=weight %></td>
				</tr>
			</div>
			<div class="search">
				<input type="text" placeholder="검색어를 입력해주세요"> <img
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</div>
			<ul>
				<li><a href="#" class="active"> <span class="icon"><i
							class="fas fa-home"></i></span> <span class="item">Home</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="fas fa-desktop"></i></span> <span class="item">Dashboard</span>
				</a></li>
				<li><a href="#"> <span class="icon"><i
							class="fas fa-user-friends"></i></span> <span class="item">회원 정보
							조회 / 수정</span>
				</a></li>
				<li><a href="daily_Weight.jsp"> <span class="icon"><i
							class="fas fa-chart-line"></i></span> <span class="item">몸무게 기록</span>
				</a></li>
			</ul>
		</div>
	</div>

	<div id="fullscreen">
		<div id="screen0"></div>
		<div id="screen1">
			<!-- 1. 일일영양분(내가먹은거/권장영양분)-->
			<div id="screen1-1"> 
			<canvas id="1-1" width = "720px" height="350px"></canvas>
		
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
			        text: '일일 영양성분 그래프'
			      }
			    }
			  });
			</script>
			</div>
			<div id="screen1-2">
			<canvas id="1-2" width = "720px" height="320px"></canvas>
			<script>
		    	new Chart(document.getElementById("1-2"), {
			    type: 'line',
			    data: {
			      labels: [<%=ww %>] ,
			      datasets: [{ 
			          data: [60, 20, 32, 50, 70, 90, 70, 88],
			          label: "관심 영양소",
			          borderColor: "#3e95cd",
			          fill: false
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '주간 관심 영양소 그래프'
			      }
			    }
			  });
			</script>	
			</div>
			<div id="screen1-3"></div>
		</div>
		<div id="screen2">
			<div id="screen2-1">
			<canvas id="2-1" width = "720px" height="150px"></canvas>
			<script>
		    	new Chart(document.getElementById("2-1"), {
			    type: 'line',
			    data: {
			      labels: [<%=ww %>] ,
			      datasets: [{ 
			          data: [60, 20, 32, 50, 70, 90, 70, 88],
			          label: "칼로리",
			          borderColor: "#3e95cd",
			          fill: false
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: '주간 칼로리 그래프'
			      }
			    }
			  });
			</script>	
			</div>
			<div id="screen2-2">
			<canvas id="2-2" width = "720px" height="150px"></canvas>
			<script> 
			    new Chart(document.getElementById("2-2"), {
			    type: 'line',
			    data: {
			      labels: [1,2,3,4,5,6,7] ,
			      datasets: [{ 
			          data: [65.4, 62.5, 60.1, 59.5, 58.0, 57.5, 57.0],
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
			<div id="screen2-3">
				<canvas id="2-3" width = "720px" height="320px"></canvas>
					<script> 
						const ctx = document.getElementById("2-3").getContext('2d');
						const myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)"],
					        datasets: [{
					            label: '검색 식품 영양 성분',
					            data: [10, 19, 6, 5, 2, 3, 50, 30],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					    	 title: {
					    	        display: true,
					    	        text: '검색 식품 영양 성분'
					    	      },
					        scales: {
					            y: {
					                beginAtZero: true
					            }
					        }
					    }
					});
					</script>
				</div>
			<div id="screen2-4"></div>
		</div>
	</div>

</body>
</html>