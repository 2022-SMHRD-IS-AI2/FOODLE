<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 		
	<h1>쿠팡에서 상품정보 크롤링해오기</h1>

	<table board="1">

		<thead>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>별점</td>
			</tr>

		</thead>

		<tbody>

		</tbody>

	</table> -->
	<form>
		<input type="text" id="srh">
		<button onclick="request()">데이터 블러오기</button>
		<button onclick="response()">추천음식</button>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
	<script>
			function request(){
			var f_name = $('#srh').val();
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
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
	<script>
	function response(){
		console.log("불러오기")
		
		// ajax를 사용해서 Flask에 요청받기
		$.ajax({
			url : 'http://222.102.104.190:8888/ex03', // 어디로?
			type : 'get',  // Get or Post
			async: false // success값을 전역변수에 담을 수 있다.
			success : function(res){
				// 요청이 성공했을 때, 실행되는 콜백 함수
				console.log(res[0].f_name); // 값 가져오기
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