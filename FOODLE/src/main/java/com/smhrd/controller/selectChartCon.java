package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

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
		
		// 추가한 식품 불러오기
		
	HttpSession session = request.getSession();
	MemberVO client = (MemberVO)session.getAttribute("client");
//	String sr = request.getParameter("sr");
	
	String mb_id = client.getMb_id();
	
//	FoodVO vo = new FoodVO();
	
	FoodDAO dao = new FoodDAO();
	List<FoodVO> name = dao.selectChart(mb_id);
	int[]arr = new int[name.size()];
	
	
	for(int i = 0; i < arr.length; i++) {
		arr[i] = name.get(i).getF_seq();
		
	}
	
	if(name.get(0).getMb_id().equals(mb_id)) {
			System.out.println("데이터 불러오기 성공");
			System.out.println(arr[0]);
	}else {
		System.out.println("데이터 불러오기 실패");
	}
	
	}

}
