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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>chart js</title>
</head>
<body>
	<canvas id="bar-chart" width="150px" height="100px"></canvas>
	<%
    int ww = 80;

 %>

	<script>
  new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: [<%=ww %>] ,
      datasets: [{ 
          data: [60, 20, 32, 50, 70, 90, 70, 88],
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
	<canvas id="2-3"></canvas>
	<script>
					new Chart(document.getElementById("2-3"), {
					type: 'bar',
			    	data: {
						// x축
						labels: [<%=ww %>] ,
						datasets: [{ 
  					// y축
 					data: [60, 20, 32, 50, 70, 90, 70, 88],
 			    	label: "몸무게",
                	borderColor: "#3e95cd",
                	fill: false
                   	}
                   	 ]
                      },
          		options: {
					title: {
				display: true,
				text: '검색 식품 영양분'
					}
					 }
					  });

</script>
<div style="width: 900px; height: 900px;">
        <!--차트가 그려질 부분-->
        <canvas id="myChart"></canvas>
   
    <script type="text/javascript">
        var context = document
            .getElementById('myChart')
            .getContext('2d');
        var myChart = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1','2','3','4','5','6','7'
                ],
                datasets: [
                    { //데이터
                        label: 'test1', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //경계선 굵기
                    }/* ,
                    {
                        label: 'test2',
                        fill: false,
                        data: [
                            8, 34, 12, 24
                        ],
                        backgroundColor: 'rgb(157, 109, 12)',
                        borderColor: 'rgb(157, 109, 12)'
                    } */
                ]
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
    </script>
     </div>
     <div style="width: 900px; height: 900px;">
        <!--차트가 그려질 부분-->
        <canvas id="myChart"></canvas>
   
    <script type="text/javascript">
        var context = document
            .getElementById('myChart')
            .getContext('2d');
        var myChart = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1','2','3','4','5','6','7'
                ],
                datasets: [
                    { //데이터
                        label: 'test1', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //경계선 굵기
                    }/* ,
                    {
                        label: 'test2',
                        fill: false,
                        data: [
                            8, 34, 12, 24
                        ],
                        backgroundColor: 'rgb(157, 109, 12)',
                        borderColor: 'rgb(157, 109, 12)'
                    } */
                ]
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
    </script>
     </div>

</body>
</html>