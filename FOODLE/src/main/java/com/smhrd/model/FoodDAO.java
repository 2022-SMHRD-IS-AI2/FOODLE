package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FoodDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true); 
	
	public List<FoodVO> selectChart(String mb_id) {
		List<FoodVO> cnt = null;
		try {
			
			cnt = sqlSession.selectList("com.smhrd.model.FoodDAO.selectChart", mb_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	
}
