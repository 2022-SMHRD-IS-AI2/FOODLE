package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager사용
		SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
		// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		
		
	
}
