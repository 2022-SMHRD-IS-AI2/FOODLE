package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberVO;
import com.smhrd.model.YgChartDAO;
import com.smhrd.model.YgChartVO;

public class AllChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("안녕하세요올차트콘입니디");
		
		MemberVO vo = (MemberVO)request.getSession().getAttribute("client"); // < - 전부 클라이언트 값 가져옴
		String id = vo.getMb_id(); //<- 아이디 가져옴
//		System.out.println(id);
		// 모든 테이블의 데이터를 불러옴 > 7개 객체 표현을 해야함...;
		
		YgChartDAO dao = new YgChartDAO(); // <- 우선 연경차트로 해둠... 추후 합치면 수정해야함
		
		// id와 연동되는 데이터베이스 전부 불러옴
		
		List<YgChartVO> weight = dao.weightChart(id); // 몸무게 데이터 불러움 
//		System.out.println(weight.size());
		int[] weiarr = new int[weight.size()]; // 같은 사이즈의 배열 생성 
		// 몸무게가 스트링? 추후에 조절해야 할 수 있음
		
//		dao.chart2(id);
//		dao.chart3(id);
//		dao.chart4(id);
//		dao.chart5(id);

		
		for(int i = 0 ; i < weight.size() ; i++) {
			YgChartVO weightVo = weight.get(i);
			weiarr[i] = weightVo.getCurr_weight();
			System.out.println(weiarr[i]); // <- 2023-01-10 15:37:53 이런 개형으로 불러와짐
		}

	
		
		
		
		
		
		
		String[] weidate = new String[weight.size()]; // 같은 사이즈의 배열 생성 

		for(int i = 0 ; i < weight.size() ; i++) { // 날짜 뽑아내기
			YgChartVO weightVo = weight.get(i);
			weidate[i] = weightVo.getWeight_regdt();
			System.out.println(weidate[i]);
		}
		
		
	}

}
