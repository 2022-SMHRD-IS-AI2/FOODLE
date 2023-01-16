package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BwChartDAO;
import com.smhrd.model.FoodVO;
import com.smhrd.model.MemberVO;

public class InsertFood extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO client = (MemberVO)session.getAttribute("client");
		int f_seq = Integer.parseInt(request.getParameter("seq"));
		String name = request.getParameter("name");
		System.out.println("인서트푸드" + name);
//		String f_name = request.getParameter("name");
		
		String mb_id = client.getMb_id();
		FoodVO vo = new FoodVO(f_seq, mb_id);
		
//		System.out.println(f_seq + mb_id);
		
		BwChartDAO dao = new BwChartDAO();
		
		int cnt = dao.insertFood(vo);
		
		if(cnt > 0) {
			System.out.println("추가 성공");
//			response.sendRedirect("BwChartCon?sr="+name);
			RequestDispatcher rd = request.getRequestDispatcher("BwChartCon");
			request.setAttribute("sr", name);
			rd.forward(request, response);
		}else {
			System.out.println("추가 실패");
			
		}
		
	}


}
