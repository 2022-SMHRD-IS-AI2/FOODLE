package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberVO;

public class AllChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("안녕하세요올차트콘입니디");
		
		MemberVO vo = (MemberVO)request.getSession().getAttribute("client"); // < - 전부 클라이언트 값 가져옴
		String id = vo.getMb_id(); //<- 아이디 가져옴
		
		// 모든 테이블의 데이터를 불러옴 > 7개 객체 표현을 해야함...;
		
		

		
	}

}
