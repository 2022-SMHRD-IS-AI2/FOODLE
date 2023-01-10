package com.smhrd.model;

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
	
	
	
	
	
	
}
