package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FoodDAO;
import com.smhrd.model.FoodVO;
import com.smhrd.model.MemberVO;

public class selectChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	HttpSession session = request.getSession();
	MemberVO client = (MemberVO)session.getAttribute("client");
	String mb_id = client.getMb_id();
	
	FoodVO vo = new FoodVO();
	
	FoodDAO dao = new FoodDAO();
	dao.selectChart(vo);
	
	
	
	}

}
