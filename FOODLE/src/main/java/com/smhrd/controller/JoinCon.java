package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String pwConfirm = request.getParameter("pwConfirm"); // <- 중복 비밀번호 체크 알고리즘은 생각 좀 해봐야 할 듯
		String mb_name = request.getParameter("mb_name");
		String mb_email = request.getParameter("mb_email");
		String mb_phone = request.getParameter("mb_phone");
		String mb_bloodtype = request.getParameter("mb_bloodtype");
		String mb_height = request.getParameter("mb_height");
		String mb_weight = request.getParameter("mb_weight");

		String[] mb_recm = request.getParameterValues("recm");
		
		
		
		

		System.out.println(mb_recm);

		MemberVO vo = new MemberVO(mb_id, mb_pw, mb_name, mb_email, mb_phone, mb_bloodtype, mb_height, mb_weight);

//		RecmVO r_vo = new RecmVO(mb_recm); // <- 관심 영양소는 별도로 관리

		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(vo);
		
		if(cnt>0) {
			
			System.out.println("가입 성공");
			
		}else {
			System.out.println("가입 실패");
			
		}

	}

}
