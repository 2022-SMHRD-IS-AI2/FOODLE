package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id"); // 값 받아오기
		String pw = request.getParameter("pw");
		MemberVO client = null;
		HttpSession session = request.getSession(); ;  // 세션 생성
		
		
		MemberVO vo = new MemberVO(id, pw);
		
		MemberDAO dao = new MemberDAO();
		client = dao.login(vo); // 회원 정보 불러오기 <- MemberVO로 전부 불러옴
		
		if(client != null) { // 성공
//			System.out.println("로그인 성공! " + name + "님 환영합니다");
//			client.getMb_name();
//			client.getMb_bloodtype();
//			client.getMb_height();
//			client.getMb_weight();
			
			session.setAttribute("client", client); // 세션에 vo 담기
			

			response.sendRedirect("AllChartCon"); // < - 올차트컨으로 가기
//			response.sendRedirect("DashBoard.jsp"); // <- 대시보드로 가기
//			response.sendRedirect("BwDashBoard.jsp"); // <- 식품추가로 가기

			
		}else {
			System.out.println("로그인 실패");
			session = request.getSession();
//			session.setAttribute("fail", "fail");
			response.sendRedirect("loginFail.jsp");
		}
		
		
		
		
		
		
		
		
	}

}
