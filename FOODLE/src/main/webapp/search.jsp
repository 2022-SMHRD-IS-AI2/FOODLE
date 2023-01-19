<%@page import="com.smhrd.model.BwChartVO"%>
<%@page import="java.util.List"%>
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
<%
    MemberVO client = (MemberVO)session.getAttribute("client");
	
    String name = client.getMb_name();
    String gender = client.getMb_gender();
    String height = client.getMb_height();
    String weight = client.getMb_weight();
    String choosenut = client.getMb_fav_ingredient();
    String food_name = request.getParameter("sr");
    
    if(food_name == null){
    	food_name = "";
    }
   
    
    List<BwChartVO> bw_name = (List<BwChartVO>)request.getAttribute("name");
   // if(bw_name != null){
			float f_ch = Float.parseFloat(bw_name.get(0).getF_ch()); // 검색식품 탄수화물
			float f_pro = Float.parseFloat(bw_name.get(0).getF_pro()); // 검색식품 단백질
			float f_fat = Float.parseFloat(bw_name.get(0).getF_fat()); // 검색식품 지방
			float f_sugar = Float.parseFloat(bw_name.get(0).getF_sugar()); // 검색식품 당류
			float f_sodium = Float.parseFloat(bw_name.get(0).getF_sodium()); // 검색식품 나트륨
			float f_col = Float.parseFloat(bw_name.get(0).getF_col()); // 검색식품 콜레스테롤
			float f_fad = Float.parseFloat(bw_name.get(0).getF_fad()); // 검색식품 포화지방
			float f_trans = Float.parseFloat(bw_name.get(0).getF_trans()); // 검색식품 트랜스지방
	
	//	}
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
 				<input type="text" name="sr" placeholder="검색어를 입력해주세요." value="<%=food_name %>">
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
        <!-- <div id="screen0"></div> -->
        <form action="BwChartCon">
        <div id="screen">
            <div class="search1">
                <input type="text" placeholder="검색어를 입력해주세요." value="<%=food_name %>" name = "sr" id="food">
            </div>
            <!-- <div id="screen-1">
            </div> -->
        </div>
      <!-- <a href="BwChartCon"><button class="btn3" type="button" > 검색 </button></a> -->
         <input type="submit" class="btn2" name="sr" value ="검색">
        </form>
       <a href="InsertFood?seq=<%=bw_name.get(0).getF_seq() %>&name=<%=bw_name.get(0).getF_name() %>"><button class="btn3" onclick='request()'> 추가 </button></a> 
        <%-- <form id="form" action="InsertFood?seq=<%=bw_name.get(0).getF_seq() %>&name=<%=bw_name.get(0).getF_name() %>"> --%>
       <!--  <input type="submit" value="추가" class="btn3" name="sr"> -->
		<!-- </form> -->
        <div id="screen1">
        	<canvas id="1-1" width = "700px" height="570px"></canvas>
			<script> 
						const ctx = document.getElementById("1-1").getContext('2d');
						const myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: ["탄수화물(g)", "단백질(g)", "지방(g)", "당류(g)", "나트륨(g)", "콜레스테롤(g)", "포화지방산(g)", "트랜스지방산(g)"],
					        datasets: [{
					            label: '검색 식품 영양 성분',
					            data: [<%=f_ch %>, <%=f_pro %>, <%=f_fat %>, <%=f_sugar %>, <%=f_sodium/1000 %>, <%=f_col/1000 %>, <%=f_fad %>, <%=f_trans %>],
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
                    <td colspan="2"><%=bw_name.get(0).getF_name() %></td>
                </tr>
                <tr>
                
                    <td  class="name">1회제공량(g)</td>
                    <td><%=bw_name.get(0).getF_gram() %></td>
                    <td  class="name">당류(g)</td>
                    <td><%=f_sugar %></td>
                </tr>
                <tr>
                    <td  class="name">열량(kcal)</td>
                    <td><%=bw_name.get(0).getF_kcal() %></td>
                    <td  class="name">나트륨(g)</td>
                    <td><%=f_sodium/1000 %></td>
                </tr>
                <tr>
                    <td  class="name">탄수화물(g)</td>
                    <td><%=f_ch %></td>
                    <td  class="name">콜레스테롤(g)</td>
                    <td> <%=f_col/1000 %></td>
                </tr>
                <tr>
                    <td  class="name">단백질(g)</td>
                    <td><%=f_pro %></td>
                    <td  class="name">포화지방산(g)</td>
                    <td><%=f_fad %></td>
                </tr>
                <tr>
                    <td  class="name">지방(g)</td>
                    <td> <%=f_fat %></td>
                    <td  class="name">트랜스지방산(g)</td>
                    <td><%=f_trans %></td>
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
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
	<script>
			function request(){
			var f_name = $('#food').val();
				
					// ajax를 사용해서 Flask에 요청보내기
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
							console.log(res);
						},
						error : function(e){
							// 요청이 실패했을 때, 실행되는 콜백 함수
							alert("error!");
						}
					});
				
		}
			
	</script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script> -->
 	<script>
	function response(){
		console.log("불러오기")
		var food = []
		// ajax를 사용해서 Flask에 요청받기
		$.ajax({
			url : 'http://222.102.104.190:8888/ex03', // 어디로?
			type : 'get',  // Get or Post
			async: false // success값을 전역변수에 담을 수 있다.
			success : function(res){
				// 요청이 성공했을 때, 실행되는 콜백 함수
				food += res[0]; // 값 가져오기
			},
			error : function(e){
				// 요청이 실패했을 때, 실행되는 콜백 함수
				alert("error!");
			}
		});
		
	}
	</script>
</body>
</html>