<%@page import="com.smhrd.model.DailyWeightVO"%>
<%@page import="com.smhrd.model.YgChartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <title>chart js</title>
</head>
<body>
    <canvas id="line-chart" width="150px" height="100px"></canvas>
 <%
   int ww = 80;
	%>
 
 
 
<form action="DailyWeightCon" method="post">
<script>
  new Chart(document.getElementById("line-chart"), {
    type: 'line',
    data: {
      labels: [<%=ww %>] ,
      datasets: [{ 
          data: [86,114,106,106,107,111,133,221,783,2478],
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
</form>

</body>
</html>