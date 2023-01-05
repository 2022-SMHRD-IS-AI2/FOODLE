package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("ID"); // 값 받아오기
		String pw = request.getParameter("PW");
		
		System.out.println(id + pw);
		
		MemberVO vo = new MemberVO(id, pw);
		
		MemberDAO dao = new MemberDAO();
		String name = dao.login(vo);
		
		if(name != null) {
			System.out.println("로그인 성공" + name +"님 환영합니다");
		}else {
			System.out.println("로그인 실패");
			
		}
		
		
		
		
		
		
		
		
	}

}
