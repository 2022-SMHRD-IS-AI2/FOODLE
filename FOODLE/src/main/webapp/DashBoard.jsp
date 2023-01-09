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
	
	대쉬보드 화면입니다~
	
	
	<%
		MemberVO client = (MemberVO)session.getAttribute("client");
		String name = client.getMb_name();
		String bloodtype = client.getMb_bloodtype();
		String height = client.getMb_height();
	%>
	
	<%=name %>님 환영합니다.
	혈액형 <%=bloodtype %>
	키 <%=height %>
	
	
	
</body>
</html>