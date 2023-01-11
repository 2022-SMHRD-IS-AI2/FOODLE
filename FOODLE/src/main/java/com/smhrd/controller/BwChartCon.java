package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
//		MemberVO client = (MemberVO)session.getAttribute("client");
		String sr = request.getParameter("sr");
		
		MemberVO vo = new MemberVO();
		BwChartDAO dao = new BwChartDAO();
		
		List<BwChartVO> name = dao.searchFood(sr);
		
		String name1 = name.get(0).getF_name();
		
		if(sr.equals(name1)) {
			RequestDispatcher rd = request.getRequestDispatcher("BwDashBoard.jsp");
			request.setAttribute("name", name);
			rd.forward(request, response);
		}else {
			System.out.println("노 식품");
		}
	
	}

}
