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
import com.smhrd.model.ChartMasterVO;
import com.smhrd.model.ChooseNutVO;
import com.smhrd.model.DailyChartVO;
import com.smhrd.model.DailyChooseVO;
import com.smhrd.model.DailyEatVO;
import com.smhrd.model.FoodDAO;
import com.smhrd.model.FoodVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.YgChartDAO;
import com.smhrd.model.YgChartVO;

public class AllChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("안녕하세요올차트콘입니디");
		
//		===============================몸무게 차트 불러오기=================================
//		   
		MemberVO client = (MemberVO)request.getSession().getAttribute("client"); // < - 전부 클라이언트 값 가져옴
		String mb_id = client.getMb_id(); //<- 아이디 가져옴
		String mb_fav_ingrident = client.getMb_fav_ingredient();
		// 모든 테이블의 데이터를 불러옴 > 7개 객체 표현을 해야함...;
		
		YgChartDAO ygdao = new YgChartDAO(); // <- 우선 연경차트로 해둠... 추후 합치면 수정해야함
		
		// id와 연동되는 데이터베이스 전부 불러옴
		
		List<YgChartVO> weight = ygdao.weightChart(mb_id); // 몸무게 데이터 불러움 
//		연경DAO-> ChartMapper 순으로 이동함
		int[] weiarr = new int[weight.size()]; // 같은 사이즈의 배열 생성 
		// 몸무게가 스트링? 추후에 조절해야 할 수 있음 조절함
		
		
		 for(int i = 0 ; i < weight.size() ; i++) { YgChartVO weightVo =
		 weight.get(i); weiarr[i] = weightVo.getCurr_weight();
		 } // <- 2023-01-10 15:37:53 이런 개형으로 불러와짐 
		 
		System.out.println("몸무게 차트임" + weiarr[0]);
//		dao.chart2(id);
//		dao.chart3(id);
//		dao.chart4(id);
//		dao.chart5(id);



// ========================= 마지막으로 섭취한 식품 조회(selectChartCon) ==================================
	// 추가한 식품 불러오기
	
	// 회원정보 세션 불러오기
//	HttpSession session = request.getSession();
//	MemberVO client = (MemberVO)session.getAttribute("client");
//	String mb_id = client.getMb_id();
	
//	FoodVO vo = new FoodVO();
	
	// 회원이 입력한 정보를 아이디 기준으로 불러오기 
	FoodDAO food_dao = new FoodDAO();
	
	BwChartVO eat_food = food_dao.dfChart(mb_id); //	아예 여기서 제일 마지막으로 섭취한 식품을 불러온다면???
	// eat_food에 가장 최근섭취한 식품 정보 담겨있음 vo형태
	// foodDao -> FoodMapper로 이동함
	
	
	
//	int[]arr = new int[eat_food.size()]; // 불러온 정보 배열에 담기 // 배열관련 코드 각주처리
//	for (int i = 0; i < arr.length; i++) {
//		arr[i] = eat_food.get(i).getF_seq();
//	}
//	if (eat_food.get(0).getMb_id().equals(mb_id)) {
//		System.out.println("데이터 불러오기 성공");
//		System.out.println(arr[0]);
//	} else {
//		System.out.println("데이터 불러오기 실패");
//	}
		
	
//		LocalDate[] weidate = new LocalDate[weight.size()]; // 같은 사이즈의 배열 생성 

//		for(int i = 0 ; i < weight.size() ; i++) { // 날짜 뽑아내기
//			YgChartVO weightVo = weight.get(i);
////			weidate[i] = weightVo.getWeight_regdt();
//			System.out.println(weidate[i]);
//		}
		
//		LocalDate now = LocalDate.now();
//		System.out.println(now);
	System.out.println(eat_food.getF_kcal());
	System.out.println("마지막 섭취 식품임");
		
		
// ============= 일간 칼로리 ==================================		
	

		BwChartDAO bwdao = new BwChartDAO(); //보원차트로 감
		List<DailyChartVO> dailyKcal = bwdao.dailyKcal(mb_id); // 여기 일별 칼로리 섭취량에 대한 리스트
//		보원차트DAO -> 푸드매퍼
		
		int a = dailyKcal.get(0).getF_kcal();
		
		System.out.println(a);
		
	
	
	
	
	
	
	
////	MemberVO client = (MemberVO)session.getAttribute("client");
//	String sr = request.getParameter("sr");
//	
//	MemberVO Bwvo = new MemberVO();
//	BwChartDAO Bwdao = new BwChartDAO();
//	
//	List<BwChartVO> name1 = Bwdao.searchFood(sr); // <- name 1
//	
//	String F_name = name1.get(0).getF_name();
//	
//	if(sr.equals(F_name)) {
//		RequestDispatcher rd = request.getRequestDispatcher("BwDashBoard.jsp");
//		request.setAttribute("name1", name1);
//		rd.forward(request, response);
//	}else {
//		System.out.println("노 식품");
//	}	
		System.out.println("일간 칼로리임");
//========================= 일간 당나지(선택한 영양소) ==================================
	
		System.out.println(mb_fav_ingrident);
		ChooseNutVO choosevo = new ChooseNutVO(mb_fav_ingrident, mb_id);
		
		System.out.println(choosevo.getMb_fav_ingredient());
		
		
		List<DailyChooseVO> dailyc = bwdao.chooseNut(choosevo);
		// 보원차트DAO로 가서 푸드매퍼로 감
		System.out.println(dailyc.get(0).getF_choosenut());
		
		
		
		
//	int f_seq = Integer.parseInt(request.getParameter("seq"));
//	
////	String f_name = request.getParameter("name");
//	
////	String insertMb_id = client.getMb_id();
//	FoodVO insertVo = new FoodVO(f_seq, mb_id);
//	
////	System.out.println(f_seq + mb_id);
//	
//	BwChartDAO insertDao = new BwChartDAO();
//	
//	int cnt = insertDao.insertFood(insertVo);
//	
//	if(cnt > 0) {
//		System.out.println("추가 성공");
//	}else {
//		System.out.println("추가 실패");
//		response.sendRedirect("BwDashBoard.jsp");
//	}
		System.out.println("일간당나지임");
//========================= 일일섭취영양분 ==================================	
	
		DailyEatVO dailyeat = food_dao.dailyeat(mb_id);
		
		System.out.println(dailyeat.getF_ch());
		// foodDAO로 감
//	여긴 일일 영양소
	
//	List<Integer> d_f_seq = ygdao.dailyIngre(mb_id);
	
	ChartMasterVO mvo = new ChartMasterVO(weight, eat_food, dailyKcal, dailyc, dailyeat);
	
	
	
	
	}

}
