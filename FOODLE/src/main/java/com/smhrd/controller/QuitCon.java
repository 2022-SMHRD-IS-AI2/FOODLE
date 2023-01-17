package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class QuitCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO client = (MemberVO)session.getAttribute("client");
		String mb_id = client.getMb_id();
		// DAO -> deleteMember() 만들기
		MemberDAO dao = new MemberDAO();
		dao.deleteuf(mb_id);
		dao.deletedw(mb_id);
		int cnt = dao.quitMember(mb_id);
		// sql 작성 (MamberMapper.xml)
		if(cnt>0) {
			System.out.println("삭제성공");
			session.removeAttribute("client");
			response.sendRedirect("QuitSuccess.jsp");
		}else {
			System.out.println("삭제실패");
		}
		
	}

}
