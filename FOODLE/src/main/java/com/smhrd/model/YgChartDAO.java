package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class YgChartDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<Integer> weight_chart(String id) {
		
		List<Integer> loginName = null;
		
		try {
			
			loginName = sqlSession.selectList("com.smhrd.model.MemberDAO.login" ,id);
			// commit / rollback 생략
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		
		
		return null;
	}
}
