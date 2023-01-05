package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String pwConfirm = request.getParameter("pwConfirm");
		String mb_name = request.getParameter("mb_name");
		String mb_email = request.getParameter("mb_email");
		String mb_phone = request.getParameter("mb_phone");
		String mb_bloodtype = request.getParameter("mb_bloodtype");
		String mb_height = request.getParameter("mb_height");
		String mb_weight = request.getParameter("mb_weight");
		String mb_recm = request.getParameter("mb_recm");
		
		
		System.out.println(mb_id + mb_bloodtype);
		
		
	}

}
