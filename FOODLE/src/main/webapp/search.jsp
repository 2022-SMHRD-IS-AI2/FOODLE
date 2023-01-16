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
                <form action="BwChartCon">
 				<input type="text" name="sr" placeholder="검색어를 입력해주세요.">
 				<input type="submit" value="검색">
                </form>
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
        <!-- <div id="screen0"></div> -->
        <div id="screen">
            <div class="search1">
                <input type="text" placeholder="검색어를 입력해주세요.">
            </div>
            <!-- <div id="screen-1">
            </div> -->
        </div>
        <button class="btn2" type="button"> 제출 </button>
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
					            data: [<%-- <%=eat_C_ch %>, <%=eat_C_pro %>, <%=eat_C_fat %>, <%=eat_C_sugar %>, <%=eat_C_sodium %>, <%=eat_C_col %>, <%=eat_C_fad %>, <%=eat_C_trans %> --%>],
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