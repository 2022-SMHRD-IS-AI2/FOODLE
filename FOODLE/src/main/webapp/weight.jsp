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

        <div>
        <table>
        <tr class="up">
            <th>입력 날짜</th>
            <th>입력 체중(kg)</th>
            <th>신장(cm)</th>
            <th>BMI 지수</th>
        </tr>
        <tr class="down">
            <td>
                <input type="date">
            </td>
            <td>
                <input type="text" placeholder="체중을 입력해주세요">
            </td>
            <td>
                <input type="text" placeholder="신장을 입력해주세요">
            </td>
            <td>18.5</td>
        </tr>
        </table>
        </div>
            <div id="screen1-1">
            </div>

        </div>

    </div>

</body>
</html>