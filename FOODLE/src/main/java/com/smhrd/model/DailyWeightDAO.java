package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class DailyWeightDAO {

	
	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager사용
			SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
			// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int dailyWeight(DailyWeightVO vo) {
		
		int cnt = 0;
		
		try { // 만약 sql문이 잘못됬다거나, url이 잘못 되었다던가 하면 세션이 잘 생성이 안될 수 있음

			// insert("실행할 sql 경로 정의", 넘겨 줄 값)
			cnt = sqlSession.insert("com.smhrd.model.DailyWeightDAO.weight", vo);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		
		
		return cnt;
		
	}
	public void selectWeight(DailyWeightVO vo) {
		
		try {
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
	}
	
}
