package com.smhrd.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BwChartDAO;
import com.smhrd.model.BwChartVO;
import com.smhrd.model.FoodDAO;
import com.smhrd.model.FoodVO;
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


// ========================= 음식 조회(selectChartCon) ==================================
	// 추가한 식품 불러오기
	
	// 회원정보 세션 불러오기
	HttpSession session = request.getSession();
	MemberVO client = (MemberVO)session.getAttribute("client");
	String mb_id = client.getMb_id();
	
//	FoodVO vo = new FoodVO();
	
	// 회원이 입력한 정보를 아이디 기준으로 불러오기 
	FoodDAO select_dao = new FoodDAO();
	List<FoodVO> name = select_dao.selectChart(mb_id);
	int[]arr = new int[name.size()]; // 불러온 정보 배열에 담기
	
	
	for (int i = 0; i < arr.length; i++) {
		arr[i] = name.get(i).getF_seq();
	}

	if (name.get(0).getMb_id().equals(mb_id)) {
		System.out.println("데이터 불러오기 성공");
		System.out.println(arr[0]);
	} else {
		System.out.println("데이터 불러오기 실패");
	}
		
//		LocalDate[] weidate = new LocalDate[weight.size()]; // 같은 사이즈의 배열 생성 

//		for(int i = 0 ; i < weight.size() ; i++) { // 날짜 뽑아내기
//			YgChartVO weightVo = weight.get(i);
////			weidate[i] = weightVo.getWeight_regdt();
//			System.out.println(weidate[i]);
//		}
		
//		LocalDate now = LocalDate.now();
//		System.out.println(now);
		
		
		
		
// ============= 음식 검색기능 & 영양분 데이터 불러오기(BwChartCon) ==================================		
	
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession();
//	MemberVO client = (MemberVO)session.getAttribute("client");
	String sr = request.getParameter("sr");
	
	MemberVO Bwvo = new MemberVO();
	BwChartDAO Bwdao = new BwChartDAO();
	
	List<BwChartVO> name1 = Bwdao.searchFood(sr);
	
	String F_name = name1.get(0).getF_name();
	
	if(sr.equals(F_name)) {
		RequestDispatcher rd = request.getRequestDispatcher("BwDashBoard.jsp");
		request.setAttribute("name1", name1);
		rd.forward(request, response);
	}else {
		System.out.println("노 식품");
	}	
	
//========================= 음식 데이터베이스 추가기능(InsertFood) ==================================
	
	session = request.getSession();
	client = (MemberVO)session.getAttribute("client");
	int f_seq = Integer.parseInt(request.getParameter("seq"));
	
//	String f_name = request.getParameter("name");
	
	String insertMb_id = client.getMb_id();
	FoodVO insertVo = new FoodVO(f_seq, insertMb_id);
	
//	System.out.println(f_seq + mb_id);
	
	BwChartDAO insertDao = new BwChartDAO();
	
	int cnt = insertDao.insertFood(insertVo);
	
	if(cnt > 0) {
		System.out.println("추가 성공");
	}else {
		System.out.println("추가 실패");
		response.sendRedirect("BwDashBoard.jsp");
	}
	
//========================= 끝 ==================================	
	
	
	
	
	}

}
