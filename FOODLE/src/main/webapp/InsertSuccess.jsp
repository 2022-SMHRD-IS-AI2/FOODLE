<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String f_n = request.getParameter("name");
%>
</head>
<body>

	<script>
		alert('음식이 추가되었습니다.')
		location.href="BwChartCon?sr="<%=f_n %>";
	</script>

</body>
</html>