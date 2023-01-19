<%@page import="com.smhrd.model.YgChartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.YgChartDAO"%>
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
    // 아래부터 몸무게 차트용 데이터 불러오기
    String mb_id = client.getMb_id(); //<- 아이디 가져옴
	String mb_fav_ingrident = client.getMb_fav_ingredient();
	YgChartDAO ygdao = new YgChartDAO();
	List<YgChartVO> weight_C = ygdao.weightChart(mb_id); // vo 통해서 통으로 불러옴
	
	String[][] weight_Cl = {{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"},{"","0"}}; 
	// 일간 몸무게 담을 리스트
    
	int cnt = 0;
    if(weight_C != null){
      	for(YgChartVO i : weight_C){ // 이중행렬에 일간 몸무게 담음
    		weight_Cl[cnt][0] = i.getWeight_regdt().toString(); // 첫번째값 날짜
    	  	weight_Cl[cnt][1] = Integer.toString(i.getCurr_weight()); // 두번째값 수치
    	  	cnt++;
    	 }
     }
    
    for (int i = 0; i < weight_Cl.length; i++) {
		for (int j = i + 1; j < weight_Cl.length; j++) {
			if(Integer.parseInt(weight_Cl[i][1]) != 0 && Integer.parseInt(weight_Cl[j][1]) != 0) {
			if (Integer.parseInt(weight_Cl[i][0].substring(8))  > Integer.parseInt(weight_Cl[j][0].substring(8))) { // 오름차순 2013-01-16
				String[] tmp = weight_Cl[i];
				weight_Cl[i] = weight_Cl[j];
				weight_Cl[j] = tmp;
				System.out.println( Integer.parseInt(weight_Cl[i][0].substring(8)) );
				
			}
			}
		}
	}
    
    
    String first_date = weight_Cl[0][0];
    String last_date = weight_Cl[6][0];
    int temp = 0;
    
    for(int i = 0; i < weight_Cl.length; i++){
    	if(Integer.parseInt(weight_Cl[i][1]) != 0){
    		if(Integer.parseInt(weight_Cl[i][0].substring(8)) > temp) {
			    last_date = weight_Cl[i][0];
			    temp = Integer.parseInt(weight_Cl[i][0].substring(8));
    		}
    		
    	}
    	
    }
    
    
    
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
                <li><a href="change.jsp"> <span class="icon"><i
                    class="fas fa-user-friends"></i></span> <span class="item">회원탈퇴</span>
                </a></li>
            </ul>
        </div>
    </div>

    <div id="fullscreen">
        <div id="screen0"></div>




		<form action="DailyWeightCon" method="post">
        <div>
       <div id="date">
            <input type="date" name="date">
        </div>
        <div id="text">
            <input type="text" placeholder="체중을 입력해주세요." name="weight">
              <input type="submit" value="제출" class="btn1">
        </div>
                
        <!-- <button class="btn1" type="button"><img src="./img/button1.png"></button>  input 으로 수정했습니다 ! -->
        <!-- <button class="btn1" type="button"> 제출 </button> -->
        </div>
        </form>

          
           <div id="screen1-0">
           <h1 id = "head"><%=first_date %> ~ <%=last_date %> <!-- *** 표현식으로 바꿔주세요! -->
           				   <br>몸무게 변화</h1>
            <div id="screen1-1">
            <canvas id="2-2" width = "1500px" height="600px"></canvas>
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
           
        </div>
        </div>>



</body>
</html>