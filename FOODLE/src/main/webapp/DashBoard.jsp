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
    // System.out.print(name);
    
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
    float dailyE_C_ch = 0; // 탄수화물
    float dailyE_C_pro = 0; // 단백질
    float dailyE_C_fat = 0; // 지방
    float dailyE_C_sugar = 0; // 당
    float dailyE_C_sodium = 0; // 나트륨
    float dailyE_C_col = 0; // 콜레스테롤
    float dailyE_C_fad = 0; // 포화지방
    float dailyE_C_trans = 0; // 트랜스지방
      
      
      if(dailyE_C != null){ // 일일섭취 영양분 풀기
    		dailyE_C_ch = Float.parseFloat(dailyE_C.getF_ch()); // 탄수화물
    		dailyE_C_pro = Float.parseFloat(dailyE_C.getF_ch()); // 단백질
    		dailyE_C_fat = Float.parseFloat(dailyE_C.getF_ch()); // 지방
    		dailyE_C_sugar = Float.parseFloat(dailyE_C.getF_ch()); // 당
    		dailyE_C_sodium = Float.parseFloat(dailyE_C.getF_ch()); // 나트륨
    		dailyE_C_col = Float.parseFloat(dailyE_C.getF_ch()); // 콜레스테롤
    		dailyE_C_fad = Float.parseFloat(dailyE_C.getF_ch()); // 포화지방
    		dailyE_C_trans = Float.parseFloat(dailyE_C.getF_ch()); // 트랜스지방
      		
      }
    // 최근 섭취 식품 변수선언  
    float eat_C_ch = 0; // 탄수화물
    float eat_C_pro = 0; // 단백질
    float eat_C_fat = 0; // 지방
    float eat_C_sugar = 0; // 당
    float eat_C_sodium = 0; // 나트륨
    float eat_C_col = 0; // 콜레스테롤
    float eat_C_fad = 0; // 포화지방
    float eat_C_trans = 0; // 트랜스지방
      
      
      if(eat_C != null){ // 최근 섭취 식품 풀기
    	  	eat_C_ch = Float.parseFloat(eat_C.getF_ch()); // 탄수화물
    	  	eat_C_pro = Float.parseFloat(eat_C.getF_pro()); // 단백질
    	  	eat_C_fat = Float.parseFloat(eat_C.getF_fat()); // 지방
    	  	eat_C_sugar = Float.parseFloat(eat_C.getF_sugar()); // 당
    	  	eat_C_sodium = Float.parseFloat(eat_C.getF_sodium()); // 나트륨
    	  	eat_C_col = Float.parseFloat(eat_C.getF_col()); // 콜레스테롤
    	  	eat_C_fad = Float.parseFloat(eat_C.getF_fad()); // 포화지방
    	  	eat_C_trans = Float.parseFloat(eat_C.getF_trans()); // 트랜스지방
      		
      }
       // 선택 영양소 변수명 변경
       if(client.getMb_fav_ingredient().equals("f_ch")){
    	   choosenut = "탄수화물";
       } else if(client.getMb_fav_ingredient().equals("f_pro")){
    	   choosenut = "단백질";
       } else if(client.getMb_fav_ingredient().equals("f_fat")){
    	   choosenut = "지방";
       } else if(client.getMb_fav_ingredient().equals("f_sugar")){
    	   choosenut = "당류";
       } else if(client.getMb_fav_ingredient().equals("f_sodium")){
    	   choosenut = "나트륨";
       } else if(client.getMb_fav_ingredient().equals("f_col")){
    	   choosenut = "콜레스테롤";
       } else if(client.getMb_fav_ingredient().equals("f_fad")){
    	   choosenut = "포화지방산";
       } else if(client.getMb_fav_ingredient().equals("f_trans")){
    	   choosenut = "트랜스지방";
       }
    
    
    
 	// 2-3 :  검색바 관련 세팅
  
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
				<div class = "p_1"><a>성별    <%=gender %></a></div>
				<div class = "p_1"><a>신장    <%=height %> cm</a></div>
				<div class = "p_1"><a>몸무게    <%=weight %> kg</a></div>
			</div>
			<div class="search">
			<form action="BwChartCon">
				<input type="text" name="sr" placeholder="검색어를 입력해주세요.">
					<input type="submit" value="검색">
			</form>
			</div>
			<ul>
				<li><a href="main.jsp"> <span class="icon"><i
							class="fas fa-home"></i></span> <span class="item">Home</span>
				</a></li>
				<li><a href="change.jsp"> <span class="icon"><i
							class="fas fa-user-friends"></i></span> <span class="item">회원 정보
							조회 / 수정</span>
				</a></li>
				<li><a href="AllChartCon"> <span class="icon"><i
							class="fas fa-desktop"></i></span> <span class="item">Dash board</span>
				</a></li>
				<li><a href="weight.jsp"> <span class="icon"><i
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
			        
			        
			          label: "일일 영양분",
			         /*  borderColor: "#3e95cd",*/
			          backgroundColor: 'rgba(60, 149, 205, 0.7)',
			          borderColor: 'rgb(60, 149, 205)',
			          fill: true,
			          borderWidth: 1
			        },
			        {
			        data: [130, 55, 66.7, 40, 1.5, 0.3, 22.2, 2.2],  //여자 권장 섭취량
			        // data: [130, 65, 66.7, 70, 1.5, 0.3, 22.2, 2.2],  //남자 권장 섭취량
				    label: "권장 영양분",
				    backgroundColor: 'rgba(201, 203, 207, 0.7)',
			        borderColor: 'rgba(201, 203, 207)',
				    fill: true,
				    borderWidth: 1
				    
				   
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
			          data: [<%=Float.parseFloat(daily_Cl[0][1]) %>, <%=Float.parseFloat(daily_Cl[1][1]) %>, <%=Float.parseFloat(daily_Cl[2][1]) %>, <%=Float.parseFloat(daily_Cl[3][1]) %>, <%=Float.parseFloat(daily_Cl[4][1]) %>, <%=Float.parseFloat(daily_Cl[5][1]) %>, <%=Float.parseFloat(daily_Cl[6][1]) %>],
			          label: "<%=choosenut %>", // ***라벨명이 지정한 변수명으로 떠요! (f_ch 면 --> 탄수화물 이렇게 바꿔야해요!!)
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
			          data: [<%=Float.parseFloat(kcal_Cl[0][1]) %>, <%=Float.parseFloat(kcal_Cl[1][1]) %>, <%=Float.parseFloat(kcal_Cl[2][1]) %>, <%=Float.parseFloat(kcal_Cl[3][1]) %>, <%=Float.parseFloat(kcal_Cl[4][1]) %>, <%=Float.parseFloat(kcal_Cl[5][1]) %>, <%=Float.parseFloat(kcal_Cl[6][1]) %>],
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
			          data: [<%=Float.parseFloat(weight_Cl[0][1]) %>, <%=Float.parseFloat(weight_Cl[1][1]) %>, <%=Float.parseFloat(weight_Cl[2][1]) %>, <%=Float.parseFloat(weight_Cl[3][1]) %>, <%=Float.parseFloat(weight_Cl[4][1]) %>, <%=Float.parseFloat(weight_Cl[5][1]) %>, <%=Float.parseFloat(weight_Cl[6][1]) %>],
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
					            backgroundColor: 'rgba(60, 149, 205, 0.7)',
						          borderColor: 'rgb(201, 203, 207)',
						          fill: true,
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