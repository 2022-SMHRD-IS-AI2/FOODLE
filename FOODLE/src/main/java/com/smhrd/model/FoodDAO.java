package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FoodDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true); 
	
	public List<FoodVO> selectChart(String mb_id) {
		List<FoodVO> eat_food = null;
		try {
			
			eat_food = sqlSession.selectOne("com.smhrd.model.FoodDAO.selectChart", mb_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return eat_food;
	}

	public BwChartVO dfChart(String mb_id) {
		BwChartVO eat_food = null;
		try {
			
			eat_food = sqlSession.selectOne("com.smhrd.model.FoodDAO.dfChart", mb_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return eat_food; // <- mb_id가 섭취한 식품을 리스트<> 형태로 리턴
	}
	
	
	public DailyEatVO dailyeat(String mb_id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true); 
		
		DailyEatVO daily = null;
		
		try {
			
			daily = sqlSession.selectOne("com.smhrd.model.FoodDAO.dailyeat", mb_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return daily;
		
		
	}
	
	
}
