<%@page import="java.time.LocalDate"%>
<%@page import="com.smhrd.model.DailyEatVO"%>
<%@page import="com.smhrd.model.DailyChooseVO"%>
<%@page import="com.smhrd.model.DailyChartVO"%>
<%@page import="com.smhrd.model.BwChartVO"%>
<%@page import="com.smhrd.model.YgChartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ChartMasterVO"%>
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
    String choosenut = client.getMb_fav_ingredient();
       System.out.print(name);
    
      ChartMasterVO mvo = (ChartMasterVO)request.getAttribute("mvo");
      
      List<DailyChooseVO>  daily_C = mvo.getDailyc(); // 일간 선택한 영양소
      DailyEatVO dailyE_C = mvo.getDailyeat(); // 일일섭취 영양소
      List<DailyChartVO> kcal_C = mvo.getDailykcal(); // 일간 섭취 칼로리
      BwChartVO eat_C = mvo.getEat_food(); // 최근 섭취한 식품
      List<YgChartVO> weight_C = mvo.getWeight(); // 몸무게
      
      String[][] daily_Cl = {{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"}}; // 일간 선호영양소 담을 리스트
      String[][] kcal_Cl = {{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"}}; // 일간 섭취 칼로리 담을 리스트
      String[][] weight_Cl = {{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"}}; // 일간 몸무게 담을 리스트
      int cnt = 0;
      if(daily_C != null){
      	for(DailyChooseVO i : daily_C){ // 이중행렬에 일간 선호영양소 담음
    	  
    	  	daily_Cl[cnt][0] = i.getU_f_dt(); // 첫번째값 날짜
    	  	daily_Cl[cnt][1] = Integer.toString(i.getF_choosenut()); // 두번째값 수치
    	 	cnt++;
      	}
      cnt = 0;
      }
      
      if(kcal_C != null){
      	for(DailyChartVO i : kcal_C){ // 이중행렬에 일간 섭취칼로리 담음
    	  
    		kcal_Cl[cnt][0] = i.getU_f_dt(); // 첫번째값 날짜
    		kcal_Cl[cnt][1] = Integer.toString(i.getF_kcal()); // 두번째값 수치
    	  	cnt++;
      	}
      cnt = 0;
      }
      
      
      if(weight_C != null){
      	for(YgChartVO i : weight_C){ // 이중행렬에 일간 몸무게 담음
    		weight_Cl[cnt][0] = i.getWeight_regdt().toString(); // 첫번째값 날짜
    	  	weight_Cl[cnt][1] = Integer.toString(i.getCurr_weight()); // 두번째값 수치
    	  	cnt++;
      	}
      }
    // 일일 섭취 변수선언  
    int dailyE_C_ch = 0; // 탄수화물
	int dailyE_C_pro = 0; // 단백질
	int dailyE_C_fat = 0; // 지방
	int dailyE_C_sugar = 0; // 당
	int dailyE_C_sodium = 0; // 나트륨
	int dailyE_C_col = 0; // 콜레스테롤
	int dailyE_C_fad = 0; // 포화지방
	int dailyE_C_trans = 0; // 트랜스지방
      
      
      if(dailyE_C != null){ // 일일섭취 영양분 풀기
    		dailyE_C_ch = Integer.parseInt(dailyE_C.getF_ch()); // 탄수화물
    		dailyE_C_pro = Integer.parseInt(dailyE_C.getF_ch()); // 단백질
    		dailyE_C_fat = Integer.parseInt(dailyE_C.getF_ch()); // 지방
    		dailyE_C_sugar = Integer.parseInt(dailyE_C.getF_ch()); // 당
    		dailyE_C_sodium = Integer.parseInt(dailyE_C.getF_ch()); // 나트륨
    		dailyE_C_col = Integer.parseInt(dailyE_C.getF_ch()); // 콜레스테롤
    		dailyE_C_fad = Integer.parseInt(dailyE_C.getF_ch()); // 포화지방
    		dailyE_C_trans = Integer.parseInt(dailyE_C.getF_ch()); // 트랜스지방
      		
      }
    // 최근 섭취 식품 변수선언  
    int eat_C_ch = 0; // 탄수화물
	int eat_C_pro = 0; // 단백질
	int eat_C_fat = 0; // 지방
	int eat_C_sugar = 0; // 당
	int eat_C_sodium = 0; // 나트륨
	int eat_C_col = 0; // 콜레스테롤
	int eat_C_fad = 0; // 포화지방
	int eat_C_trans = 0; // 트랜스지방
      
      
      if(eat_C != null){ // 일일섭취 영양분 풀기
    	  	eat_C_ch = Integer.parseInt(dailyE_C.getF_ch()); // 탄수화물
    	  	eat_C_pro = Integer.parseInt(dailyE_C.getF_ch()); // 단백질
    	  	eat_C_fat = Integer.parseInt(dailyE_C.getF_ch()); // 지방
    	  	eat_C_sugar = Integer.parseInt(dailyE_C.getF_ch()); // 당
    	  	eat_C_sodium = Integer.parseInt(dailyE_C.getF_ch()); // 나트륨
    	  	eat_C_col = Integer.parseInt(dailyE_C.getF_ch()); // 콜레스테롤
    	  	eat_C_fad = Integer.parseInt(dailyE_C.getF_ch()); // 포화지방
    	  	eat_C_trans = Integer.parseInt(dailyE_C.getF_ch()); // 트랜스지방
      		
      }
      
       
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
					<td><%=height %> cm</td>
					<br>
					<td>WEIGHT</td>
					<td><%=weight %> kg</td>
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
			<canvas id="1-1" width = "700px" height="350px" margin ="auto"></canvas>
		
			<script> 
			    new Chart(document.getElementById("1-1"), {
			    type: 'bar',
			    data: {
			      labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)" ] ,
			      datasets: [{ 
			           data: [<%=dailyE_C_ch %>, <%=dailyE_C_pro %>, <%=dailyE_C_fat %>, <%=dailyE_C_sugar %>, <%=dailyE_C_sodium %>, <%=dailyE_C_col %>, <%=dailyE_C_fad %>, <%=dailyE_C_trans %>], 
			          /* data: [60,60,60,60,60,60], */
			        
			          label: "일일 영양분",
			          borderColor: "#3e95cd",
			          fill: false
			        },
			        {
			        data: [60, 20, 32, 50, 70, 90],
				    label: "권장 영양분",
				    borderColor: "#3e95cd",
				    	
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
			<!-- 1-2. 주간 관심 영양소 그래프(EX.당, 나트륨,,, 택1)-->
			<canvas id="1-2" width = "720px" height="320px"  margin ="auto"></canvas>
			<script>
		    	new Chart(document.getElementById("1-2"), {
			    type: 'line',
			    data: {
			      labels: ["<%=daily_Cl[0][0] %>", "<%=daily_Cl[1][0] %>","<%=daily_Cl[2][0] %>","<%=daily_Cl[3][0] %>","<%=daily_Cl[4][0] %>","<%=daily_Cl[5][0] %>","<%=daily_Cl[6][0] %>"] ,
			      datasets: [{ 
			          data: [<%=Integer.parseInt(daily_Cl[0][1]) %>, <%=Integer.parseInt(daily_Cl[1][1]) %>, <%=Integer.parseInt(daily_Cl[2][1]) %>, <%=Integer.parseInt(daily_Cl[3][1]) %>, <%=Integer.parseInt(daily_Cl[4][1]) %>, <%=Integer.parseInt(daily_Cl[5][1]) %>, <%=Integer.parseInt(daily_Cl[6][1]) %>],
			          label: "<%=choosenut %>",
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
			<div id="screen1-3">
			<!-- 1-3. 추천 식단 -->
			</div>
		</div>
		<div id="screen2">
			<div id="screen2-1">
			<!-- 2-1. 주간 칼로리-->
			<canvas id="2-1" width = "720px" height="150px"  margin ="auto"></canvas>
			<script>
		    	new Chart(document.getElementById("2-1"), {
			    type: 'line',
			    data: {
			      labels: ["<%=kcal_Cl[0][0] %>", "<%=kcal_Cl[1][0] %>","<%=kcal_Cl[2][0] %>","<%=kcal_Cl[3][0] %>","<%=kcal_Cl[4][0] %>","<%=kcal_Cl[5][0] %>","<%=kcal_Cl[6][0] %>"] ,
			      datasets: [{ 
			          data: [<%=Integer.parseInt(kcal_Cl[0][1]) %>, <%=Integer.parseInt(kcal_Cl[1][1]) %>, <%=Integer.parseInt(kcal_Cl[2][1]) %>, <%=Integer.parseInt(kcal_Cl[3][1]) %>, <%=Integer.parseInt(kcal_Cl[4][1]) %>, <%=Integer.parseInt(kcal_Cl[5][1]) %>, <%=Integer.parseInt(kcal_Cl[6][1]) %>],
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
			<!-- 2-2. 주간 몸무게-->
			<canvas id="2-2" width = "720px" height="150px"  margin ="auto"></canvas>
			<script> 
			    new Chart(document.getElementById("2-2"), {
			    type: 'line',
			    data: {
			      labels: ["<%=weight_Cl[0][0] %>", "<%=weight_Cl[1][0] %>","<%=weight_Cl[2][0] %>","<%=weight_Cl[3][0] %>","<%=weight_Cl[4][0] %>","<%=weight_Cl[5][0] %>","<%=weight_Cl[6][0] %>"] ,
			      datasets: [{ 
			          data: [<%=Integer.parseInt(weight_Cl[0][1]) %>, <%=Integer.parseInt(weight_Cl[1][1]) %>, <%=Integer.parseInt(weight_Cl[2][1]) %>, <%=Integer.parseInt(weight_Cl[3][1]) %>, <%=Integer.parseInt(weight_Cl[4][1]) %>, <%=Integer.parseInt(weight_Cl[5][1]) %>, <%=Integer.parseInt(weight_Cl[6][1]) %>],
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
				<!-- 2-3. 검색 식품 영양분-->
				<canvas id="2-3" width = "720px" height="320px"  margin ="auto"></canvas>
					<script> 
						const ctx = document.getElementById("2-3").getContext('2d');
						const myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)"],
					        datasets: [{
					            label: '검색 식품 영양 성분',
					            data: [<%=eat_C_ch %>, <%=eat_C_pro %>, <%=eat_C_fat %>, <%=eat_C_sugar %>, <%=eat_C_sodium %>, <%=eat_C_col %>, <%=eat_C_fad %>, <%=eat_C_trans %>],
					            backgroundColor: [
					            	'rgba(255, 99, 132, 0.2)',
					                'rgba(255, 159, 64, 0.2)',
					                'rgba(255, 205, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(95, 213, 16, 0.2)',
					                'rgba(97, 126, 255, 0.2)',
					              ],
					              borderColor: [
					                'rgb(255, 99, 132)',
					                'rgb(255, 159, 64)',
					                'rgb(255, 205, 86)',
					                'rgb(75, 192, 192)',
					                'rgb(54, 162, 235)',
					                'rgb(153, 102, 255)',
					                'rgb(95, 213, 16)',
					                'rgb(97, 126, 255)'
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
			<div id="screen2-4">
			<!-- 2-4. 건강 뉴스-->
			</div>
		</div>
	</div>

</body>
</html>