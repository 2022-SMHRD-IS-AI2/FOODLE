<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BwChartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
  <meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
 <form action="BwChartCon">
 	<input type="text" name="sr">
 	<input type="submit" value="검색">
 	
 
 </form>
 	<%
 		List<BwChartVO> chart = (List<BwChartVO>)request.getAttribute("name");
 		chart.get(0).getF_seq();
 		chart.get(0).getF_name();
 	
 	%>
 	
 	<button><a href="#?seq<%=chart.get(0).getF_seq() %>"></a></button>
</body>
</html>