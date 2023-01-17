package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager사용
		SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
		// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
		
		
		public int join(MemberVO vo) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int cnt = 0;
			
			try { // 만약 sql문이 잘못됬다거나, url이 잘못 되었다던가 하면 세션이 잘 생성이 안될 수 있음

				// insert("실행할 sql 경로 정의", 넘겨 줄 값)
				cnt = sqlSession.insert("com.smhrd.model.MemberDAO.join", vo);



			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			
			return cnt;
			
		}
		
		public MemberVO login(MemberVO vo) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			MemberVO loginName = null;
			try {
				
				loginName = sqlSession.selectOne("com.smhrd.model.MemberDAO.login" ,vo);
				// commit / rollback 생략
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return loginName;
			
		}
		
		public int change(MemberVO vo) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int cnt =0 ;
			try { // 만약 sql문이 잘못됬다거나, url이 잘못 되었다던가 하면 세션이 잘 생성이 안될 수 있음

				// insert("실행할 sql 경로 정의", 넘겨 줄 값)
				cnt = sqlSession.insert("com.smhrd.model.MemberDAO.change", vo);



			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			
			return cnt;
		}
		
		public int deletedw(String mb_id) {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("com.smhrd.model.MemberDAO.deletedw", mb_id);
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
		public int deleteuf(String mb_id) {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("com.smhrd.model.MemberDAO.deleteuf", mb_id);
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
		public int quitMember(String mb_id) {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("com.smhrd.model.MemberDAO.quitMember", mb_id);
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
		public int IdCheck(String mb_id) {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("com.smhrd.model.MemberDAO.IdCheck", mb_id);
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
}
		
		
		
	

