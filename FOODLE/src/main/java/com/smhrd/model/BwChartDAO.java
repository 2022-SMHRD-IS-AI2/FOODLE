package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BwChartDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public String todayChart(String vo) {
		// 식품 검색할 때 아이디 기준
		
		String todayChart = null;
		
		try {
			todayChart = sqlSession.selectOne("com.smhrd.BwChartDAO.todayChart", vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return todayChart;
		
	}
	
	public int userChart(String vo) {
		// 시퀀스 기준으로 불러올 떄
		int cnt = 0;
		
		try {
			
			cnt = sqlSession.selectOne("com.smhrd.model.BwChartDAO.userChart", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public List<BwChartVO> searchFood(String f_name) {
		List<BwChartVO> search = null;
		
		try {
			
			search = sqlSession.selectList("com.smhrd.model.MemberDAO.searchFood", f_name);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return search;
	}
	
	public int insertFood(FoodVO vo) {
			int cnt = 0;
		try {
			
			cnt = sqlSession.insert("com.smhrd.model.MemberDAO.insertFood", vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}

	
	public List<DailyChartVO> dailyKcal(String mb_id) { // 일간 칼로리 그래프
		
		List<DailyChartVO> dK = null;
		
		try {
			
			dK = sqlSession.selectList("com.smhrd.model.FoodDAO.searchKcal", mb_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dK;
	}
	
		
	public List<DailyChooseVO> chooseNut(ChooseNutVO ChooseNutVO) { // 일간 선호영양분 그래프
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<DailyChooseVO> dailyChoose = null;
		
		try {
			
			dailyChoose = sqlSession.selectList("com.smhrd.model.FoodDAO.chooseNut", ChooseNutVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dailyChoose;
	}
	
	
	
	
	
	
	}

	
	
	
	
	

