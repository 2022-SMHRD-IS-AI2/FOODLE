package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BwChartDAO;
import com.smhrd.model.BwChartVO;

public class InsertFood extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String seq = request.getParameter("seq");
		String name = request.getParameter("name");
	
		BwChartVO vo = new BwChartVO(seq,name);
		
		BwChartDAO dao = new BwChartDAO();
		
		dao.insertFood(vo);
		
	}


}
