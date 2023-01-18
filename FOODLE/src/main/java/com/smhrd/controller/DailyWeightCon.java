package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DailyWeightDAO;
import com.smhrd.model.DailyWeightVO;
import com.smhrd.model.MemberVO;

public class DailyWeightCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		Float curr_weight = Float.parseFloat(request.getParameter("weight")); // 몸무게 받음
		String date = request.getParameter("date"); // 해당 날짜 받음
		System.out.println(date);
		
		
		
		
		MemberVO mbvo = (MemberVO)request.getSession().getAttribute("client"); // 여기서 사용자의 id값이 있는 vo 불러옴
		String mb_id = mbvo.getMb_id(); // id 추출 후 변수에 담음
		
		
		DailyWeightVO vo = new DailyWeightVO(curr_weight, mb_id, date);  // 하나로 합쳐서 vo로 만듦
		
		DailyWeightDAO dao = new DailyWeightDAO();
		int cnt = dao.dailyWeight(vo); // 성공하면 1 실패하면 0을 벹는 쿼리문
		
		
		if(cnt > 0) {
			response.sendRedirect("DailyWeightSuccess.jsp"); // 성공하면 해당페이지로 감
		}else {
			System.out.println("실패했습니다.");
		}
		
		
		
		
		
		
	}

}
