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
    <title>Document</title>
    <link rel="stylesheet" href="css/DashBoard_style.css">
</head>
<body>

 <%
		MemberVO client = (MemberVO)session.getAttribute("client");
		String name = client.getMb_name();
		String bloodtype = client.getMb_bloodtype();
		String height = client.getMb_height();
		String weight = client.getMb_weight();
		System.out.print(name);
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
                <tr>
                    <td>BLOODTYPE</td> <!-- 블러드 타입 gender로 바꾸기!! -->
                    <td><%=bloodtype %></td> <br>
                    <td>HEIGHT</td>
                    <td><%=height %></td> <br>
                    <td>WEIGHT</td>
                    <td><%=weight %></td>
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
                    <a href="BwDashBoard.jsp">
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
                    <a href="daily_Weight.jsp">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">몸무게 기록</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div id="fullscreen">
        <div id="screen0"></div>
        <div id="screen1">
            <div id="screen1-1">
            </div>
            <div id="screen1-2">
            </div>
            <div id="screen1-3">
            </div>
        </div>
        <div id="screen2">
            <div id="screen2-1">
            </div>
            <div id="screen2-2">
            </div>
            <div id="screen2-3">
            </div>
            <div id="screen2-4">
            </div>
        </div>
    </div>

</body>
</html>

	