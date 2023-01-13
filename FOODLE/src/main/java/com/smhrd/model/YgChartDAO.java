package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class YgChartDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		
		public List<YgChartVO> weightChart(String mb_id) { // 몸무게 차트 불러오는 메소드
			List<YgChartVO> WeightList = null;

			try {
				WeightList = sqlSession.selectList("com.smhrd.model.YgChartDAO.weightChart", mb_id);
				// 차트매퍼로 이동함
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return WeightList;
		}
		
		
		
		
		
		
		public String KcalChart(BwChartVO vo) {
			String KcalChart = null;
			
			try {
				KcalChart = sqlSession.selectOne("com.smhrd.YgChartDAO.KcalChart", vo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return KcalChart;
			
		}
		
		public List<Integer> dailyIngre (String mb_id) {
			List<Integer> d_f_seq = null;
			
			try {
				d_f_seq = sqlSession.selectList("com.smhrd.YgChartDAO.d_f_seq", mb_id);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return d_f_seq;
			
		}
		
		
		
}

