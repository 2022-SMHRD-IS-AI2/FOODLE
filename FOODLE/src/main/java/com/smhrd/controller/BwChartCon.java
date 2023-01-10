package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BwChartDAO;
import com.smhrd.model.BwChartVO;
import com.smhrd.model.MemberVO;

public class BwChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("client");
		
		int seq = 0;
		String member = null;
		
		BwChartDAO dao = new BwChartDAO(); 
		BwChartVO vo2 = new BwChartVO();
		
		member = dao.todayChart(vo.getMb_id()); // 회원 아이디 값
		
		seq = (Integer)dao.userChart(vo2.getU_f_seq()); // 회원 시퀀스 값
		
		if(member.equals(vo2.getU_f_seq())) {
			System.out.println("데이터 불러오기 성공");
		}else {
			System.out.println("데이터 불러오기 실패");
		}
	
	
	}

}
