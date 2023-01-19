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

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

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
import com.smhrd.model.NewsVO;
import com.smhrd.model.YgChartDAO;
import com.smhrd.model.YgChartVO;

public class AllChartCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		System.out.println("안녕하세요올차트콘입니디");

//		===============================몸무게 차트 불러오기=================================
//		   
		MemberVO client = (MemberVO) request.getSession().getAttribute("client"); // < - 전부 클라이언트 값 가져옴
		String mb_id = client.getMb_id(); // <- 아이디 가져옴
		String mb_fav_ingrident = client.getMb_fav_ingredient();
		// 모든 테이블의 데이터를 불러옴 > 7개 객체 표현을 해야함...;

		YgChartDAO ygdao = new YgChartDAO(); // <- 우선 연경차트로 해둠... 추후 합치면 수정해야함

		// id와 연동되는 데이터베이스 전부 불러옴

		List<YgChartVO> weight = ygdao.weightChart(mb_id); // 몸무게 데이터 불러움
//		연경DAO-> ChartMapper 순으로 이동함
		// int[] weiarr = new int[weight.size()]; // 같은 사이즈의 배열 생성
		// 몸무게가 스트링? 추후에 조절해야 할 수 있음 조절함

// ========================= 마지막으로 섭취한 식품 조회(selectChartCon) ==================================
		// 추가한 식품 불러오기

		// 회원이 입력한 정보를 아이디 기준으로 불러오기
		FoodDAO food_dao = new FoodDAO();

		BwChartVO eat_food = food_dao.dfChart(mb_id); // 아예 여기서 제일 마지막으로 섭취한 식품을 불러온다면???
		// eat_food에 가장 최근섭취한 식품 정보 담겨있음 vo형태
		// foodDao -> FoodMapper로 이동함

// ============= 일간 칼로리 ==================================		

		BwChartDAO bwdao = new BwChartDAO(); // 보원차트로 감
		List<DailyChartVO> dailyKcal = bwdao.dailyKcal(mb_id); // 여기 일별 칼로리 섭취량에 대한 리스트
//		보원차트DAO -> 푸드매퍼

//		System.out.println("일간 칼로리임");
//========================= 일간 당나지(선택한 영양소) ==================================

		System.out.println(mb_fav_ingrident);
		ChooseNutVO choosevo = new ChooseNutVO(mb_fav_ingrident, mb_id);

//		System.out.println(choosevo.getMb_fav_ingredient());

		List<DailyChooseVO> dailyc = bwdao.chooseNut(choosevo);
		// 보원차트DAO로 가서 푸드매퍼로 감
		// System.out.println(dailyc.get(0).getF_choosenut());

//		System.out.println("일간당나지임");
//========================= 일일섭취영양분 ==================================	

		DailyEatVO dailyeat = food_dao.dailyeat(mb_id);

		
//========================= 뉴우스 영역 ==================================

		String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=";
		String favorite = client.getMb_fav_ingredient();
		
		
		// 선택 영양소 변수명 변경
		 if(client.getMb_fav_ingredient().equals("f_ch")){
			 favorite = "탄수화물";
	       } else if(client.getMb_fav_ingredient().equals("f_pro")){
	    	   favorite = "단백질";
	       } else if(client.getMb_fav_ingredient().equals("f_fat")){
	    	   favorite = "지방";
	       } else if(client.getMb_fav_ingredient().equals("f_sugar")){
	    	   favorite = "당류";
	       } else if(client.getMb_fav_ingredient().equals("f_sodium")){
	    	   favorite = "나트륨";
	       } else if(client.getMb_fav_ingredient().equals("f_col")){
	    	   favorite = "콜레스테롤";
	       } else if(client.getMb_fav_ingredient().equals("f_fad")){
	    	   favorite = "포화지방산";
	       } else if(client.getMb_fav_ingredient().equals("f_trans")){
	    	   favorite = "트랜스지방";
	       }
		
		
		
		
		System.out.println(favorite);
		
		Document doc = Jsoup.connect(url + favorite).get();
		
		
//		String a = doc.html();
		
		Elements title = doc.select("#sp_nws1 a.news_tit");
		Elements text = doc.select("#sp_nws1 div.news_dsc");
		Elements thumb = doc.select("#sp_nws1 a.dsc_thumb>img");
		
		NewsVO nvo = new NewsVO(title, text, thumb);
		
		ChartMasterVO mvo = new ChartMasterVO(weight, eat_food, dailyKcal, dailyc, dailyeat, nvo); // 모은 데이터 전부 담기
//========================= 보내기 ==================================		
		
		RequestDispatcher rd = request.getRequestDispatcher("DashBoard.jsp");
		request.setAttribute("mvo", mvo);
		rd.forward(request, response);
		
		
	}

}
