package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BwChartDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<String> todayChart(String vo) {
		List<String> todayChart = null;
		
		try {
			todayChart = sqlSession.selectList("com.smhrd.BwChartDAO.todayChart", vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return todayChart;
		
	}
	
	public void userChart() {
		
	}
	
	
	
	
	
	
}
