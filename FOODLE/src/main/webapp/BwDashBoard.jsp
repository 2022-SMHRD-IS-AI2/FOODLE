<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
 	<%
 		String name = "";
 		List<BwChartVO> chart = (List<BwChartVO>)request.getAttribute("name");
 		if(chart != null){
 			int seq = chart.get(0).getF_seq();
 			name = chart.get(0).getF_name();
 		}
 		
 	%>
 	
 <form action="BwChartCon">
 	<input type="text" name="sr" placeholder="<%=name %>">
 	<input type="submit" value="검색">
 	
 
 </form>
 	
 	<%if(chart != null){ %>
 	<button><a href="InsertFood?seq=<%=chart.get(0).getF_seq() %>&name=<%=chart.get(0).getF_name() %>">추가하기</a></button>
 	<%} %>
 	
 	<%if(chart != null){ %>
 	<button><a href="selectChartCon">조회하기</a></button>
 	<%} %>
 	
 	
 	
</body>
</html>