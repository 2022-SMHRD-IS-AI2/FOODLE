package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class ChangeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO client = (MemberVO)session.getAttribute("client");
		request.setCharacterEncoding("utf-8");
		
		String mb_id = client.getMb_id();
		String mb_pw = request.getParameter("mb_pw");
		String mb_name = request.getParameter("mb_name");
		String mb_phone = request.getParameter("mb_phone");
		String mb_bloodtype = request.getParameter("mb_bloodtype");
		String mb_height = request.getParameter("mb_height");
		String mb_weight = request.getParameter("mb_weight");
		String mb_gender = request.getParameter("mb_gender");
		String mb_fav_ingredient = request.getParameter("fav_ingredient"); // <- 선호 영양소
		
		
		
		MemberVO vo = new MemberVO(mb_id, mb_pw, mb_name, mb_bloodtype, mb_phone, mb_height, mb_weight, mb_gender,mb_fav_ingredient);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.change(vo);
		System.out.println("여기에 나온다");
		System.out.println(mb_id + mb_pw);

		if(cnt>0) {
			MemberVO id_vo = new MemberVO(mb_id, mb_pw);
			MemberVO Nclient = dao.login(id_vo);
			System.out.println("수정 성공");
			System.out.println(Nclient.getMb_id());
			session.setAttribute("client", Nclient);
			response.sendRedirect("ChangeSuccess.jsp");
			
		}else {
			System.out.println("수정 실패");
			
		}
	}

}
