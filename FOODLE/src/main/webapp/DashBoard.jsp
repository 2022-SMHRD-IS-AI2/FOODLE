<%@page import="com.smhrd.model.NewsVO"%>
<%@page import="org.jsoup.select.Elements"%>
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
      NewsVO nvo = mvo.getNvo(); // 뉴스 크롤링한 데이터
      
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
          dailyE_C_pro = Float.parseFloat(dailyE_C.getF_pro()); // 단백질
          dailyE_C_fat = Float.parseFloat(dailyE_C.getF_fat()); // 지방
          dailyE_C_sugar = Float.parseFloat(dailyE_C.getF_sugar()); // 당
          dailyE_C_sodium = Float.parseFloat(dailyE_C.getF_sodium()); // 나트륨
          dailyE_C_col = Float.parseFloat(dailyE_C.getF_col()); // 콜레스테롤
          dailyE_C_fad = Float.parseFloat(dailyE_C.getF_fad()); // 포화지방
          dailyE_C_trans = Float.parseFloat(dailyE_C.getF_trans()); // 트랜스지방
            
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
    
    
    for (int i = 0; i < daily_Cl.length; i++) { // 일간 선호영양소 재배열
      for (int j = i + 1; j < daily_Cl.length; j++) {
         if(Integer.parseInt(daily_Cl[i][1]) != 0 && Integer.parseInt(daily_Cl[j][1]) != 0) {
         if (Integer.parseInt(daily_Cl[i][0])  > Integer.parseInt(daily_Cl[j][0])) { 
            String[] tmp = daily_Cl[i];
            daily_Cl[i] = daily_Cl[j];
            daily_Cl[j] = tmp;
         }
         }
      }
   }
    
    for (int i = 0; i < kcal_Cl.length; i++) { // 일간 섭취 칼로리 재배열
      for (int j = i + 1; j < kcal_Cl.length; j++) {
         if(Integer.parseInt(kcal_Cl[i][1]) != 0 && Integer.parseInt(kcal_Cl[j][1]) != 0) {
         if (Integer.parseInt(kcal_Cl[i][0])  > Integer.parseInt(kcal_Cl[j][0])) { // 오름차순
            String[] tmp = kcal_Cl[i];
            kcal_Cl[i] = kcal_Cl[j];
            kcal_Cl[j] = tmp;
         }
         }
      }
   }
    
    for (int i = 0; i < weight_Cl.length; i++) { // 일간 몸무게 재배열
      for (int j = i + 1; j < weight_Cl.length; j++) {
         if(Integer.parseInt(weight_Cl[i][1]) != 0 && Integer.parseInt(weight_Cl[j][1]) != 0) {
         if (Integer.parseInt(weight_Cl[i][0].substring(8))  > Integer.parseInt(weight_Cl[j][0].substring(8))) { // 오름차순 2013-01-16
            String[] tmp = weight_Cl[i];
            weight_Cl[i] = weight_Cl[j];
            weight_Cl[j] = tmp;
            /* System.out.println( Integer.parseInt(weight_Cl[i][0].substring(8)) ); */
            
         }
         }
      }
   }
    
    // 뉴스 크롤링 데이터 풀기
    
   
    String title = nvo.getTitle().toString();
    String text = nvo.getText().html();
    String img = nvo.getThumb().attr("data-lazysrc");
    
    
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
            
            <li><a href="AllChartCon"> <span class="icon"><i
                     class="fas fa-desktop"></i></span> <span class="item">Dash board</span>
            </a></li>
            <li><a href="weight.jsp"> <span class="icon"><i
                     class="fas fa-chart-line"></i></span> <span class="item">몸무게 기록</span>
            </a></li>
                <li><a href="change.jsp"> <span class="icon"><i
                    class="fas fa-user-friends"></i></span> <span class="item">회원 정보
                    조회 / 수정</span>
                </a></li>
                <li><a href="QuitCon"> <span class="icon"><i
                    class="fas fa-user-friends"></i></span> <span class="item">회원탈퇴</span>
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
                    data: [<%=dailyE_C_ch %>, <%=dailyE_C_pro %>, <%=dailyE_C_fat %>, <%=dailyE_C_sugar %>, <%=dailyE_C_sodium/1000 %>, <%=dailyE_C_col/1000 %>, <%=dailyE_C_fad %>, <%=dailyE_C_trans %>], 
                 
                 
                   label: "일일 영양분",
                  /*  borderColor: "#3e95cd",*/
                   backgroundColor: 'rgba(60, 149, 205, 0.7)',
                   borderColor: 'rgb(60, 149, 205)',
                   fill: true,
                   borderWidth: 1
                 },
                 {
                 <%if(gender.equals("woman")) {%>
                 data: [130, 55, 66.7, 40, 1.5, 0.3, 22.2, 2.2],  //여자 권장 섭취량
                 <%} else{ %>
                 data: [130, 65, 66.7, 70, 1.5, 0.3, 22.2, 2.2],  //남자 권장 섭취량
                 <% } %>
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
         <div id="screen1-2_0">
         <button class="btn4" onclick='response()'> 추천 음식을 원하세요? </button> <!-- 여기에 버튼 넣으려면  css에서 버튼 크기 수정해야함 -->
         <div id="screen1-2">
         <canvas id="1-2" width = "670px" height="270px"  margin ="auto"></canvas>
         
         <script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
            <script> 
               
            var resName;
            var resCh;
            var resPro;
            var resFat;
            var resSugar;
            var resSodium;
            var resCol;
            var resFad;
            var resTrans;
            let a = 0;
         function response(){ 
            console.log("불러오기")
            
            
            
           
            // ajax를 사용해서 Flask에 요청받기
          /*   if('.btn4'.click){ */
   ///========================================================== 차트 
	            $.ajax({
	            	
	               url : 'http://222.102.104.190:8888/ex03', // 어디로?
	               type : 'get',  // Get or Post
	               /* async : false */  // success값을 전역변수에 담을 수 있다.
	               data : {
	                  // 어떤 데이터를?
	                  // key=123@data=456
	                  // "key" : "value"
	                  "f_name" : f_name,
	                  },
	               
	               success : function(res){
	                  // 요청이 성공했을 때, 실행되는 콜백 함수
	                  
	                     resName = res[a].F_NAME
	                     resCh = parseInt(res[a].F_CH)
	                     resPro = parseInt(res[a].F_PRO)
	                     resFat = parseInt(res[a].F_FAT)
	                     resSugar = parseInt(res[a].F_SUGAR)
	                     resSodium = parseInt(res[a].F_SODIUM)/1000
	                     resCol = parseInt(res[a].F_COL)/1000
	                     resFad = parseInt(res[a].F_FAD)
	                     resTrans = parseInt(res[a].F_TRANS)
	                     console.log(resFad) 
	                      a = a+1;
	                     new Chart(document.getElementById("1-2"), {
	                         type: 'radar',
	                         data: {
	                           labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)" ] ,
	                           datasets: [{ 
	                              label: resName,
	                               data: [resCh, resPro, resFat, resSugar, resSodium, resCol, resFad, resTrans],
	                               backgroundColor: 'rgba(255, 99, 132, 0.2)',
	                               borderColor: 'rgb(255, 99, 132)',
	                               fill: true,
	                              borderWidth: 1
	                               } /*, {
	                                label: "권장 영양분",
	                                data: [28, 48, 40, 19, 96, 27, 100,52],
	                                 backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                                 borderColor: 'rgb(54, 162, 235)',
	                                 
	                                 fill: true,
	                                 borderWidth: 1
	                                  } */
	                               ]
	                            },
	                           options: {
	                           title: {
	                           display: true,
	                           text: '추천 음식'
	                           }
	                         }
	                       });
	                  /* var arr = arr.unshift(res); // 값 가져오기
	                  console.log('안녕'+ arr); */
	               },
	               error : function(e){
	                  // 요청이 실패했을 때, 실행되는 콜백 함수
	                  alert("error!");
	               }
	            });
	            
            }
           
            
          
            
             new Chart(document.getElementById("1-2"), {
             type: 'radar',
             data: {
               labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)" ] ,
               datasets: [{ 
                  label: "일일 영양분",
                   data: [resCh, resPro, resFat, resSugar, resSodium, resCol, resFad, resTrans],
                   backgroundColor: 'rgba(255, 99, 132, 0.2)',
                   borderColor: 'rgb(255, 99, 132)',
                   fill: true,
                  borderWidth: 1
                   } /*, {
                    label: "권장 영양분",
                    data: [28, 48, 40, 19, 96, 27, 100,52],
                     backgroundColor: 'rgba(54, 162, 235, 0.2)',
                     borderColor: 'rgb(54, 162, 235)',
                     
                     fill: true,
                     borderWidth: 1
                      } */
                   ]
                },
               options: {
               title: {
               display: true,
               text: '추천 음식'
               }
             }
           });
         </script>
         </div>
         
         </div>
         <div id="screen1-3">
         <!-- 1-3. 주간 관심 영양소 그래프(EX.당, 나트륨,,, 택1)-->
         <canvas id="1-3" width = "720px" height="150px"  margin ="auto"></canvas>
         <script>
             new Chart(document.getElementById("1-3"), {
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
                           label: '<%=eat_C.getF_name() %>',
                           data: [<%=eat_C_ch %>, <%=eat_C_pro %>, <%=eat_C_fat %>, <%=eat_C_sugar %>, <%=eat_C_sodium/1000 %>, <%=eat_C_col/1000 %>, <%=eat_C_fad %>, <%=eat_C_trans %>],
                           backgroundColor: 'rgba(60, 149, 205, 0.7)',
                            borderColor: 'rgb(201, 203, 207)',
                            fill: true,
                           borderWidth: 1
                       }]
                   },
                   options: {
                       title: {
                              display: true,
                              text: '최근 섭취 식품'
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
         <%=title %>
         <%=text %>
         <img src="<%=img %>" width="132" height="90">
         
         
         
         
         
         
         </div>
      </div>
   </div>
   <script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
   <script>
      
      
      
      
      
      const f_name = "<%=eat_C.getF_name() %>";
      
      $.ajax({
         url : 'http://222.102.104.190:8888/ex02', // 어디로?
         type : 'get',  // Get or Post
         data : {
            // 어떤 데이터를?
            // key=123@data=456
            // "key" : "value"
            "f_name" : f_name,
            },
            success : function(res){
               // 요청이 성공했을 때, 실행되는 콜백 함수
               console.log("안녕"+res);
            },
            error : function(e){
               // 요청이 실패했을 때, 실행되는 콜백 함수
               alert("error!");
            }
         });
   </script>
</body>
</html>