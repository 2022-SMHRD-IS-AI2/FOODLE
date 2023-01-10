package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class YgChartDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		public List<YgChartDAO> weight_chart() {
			List<YgChartDAO> list = null;

			try {
				list = sqlSession.selectList("com.smhrd.model.YgChartDAO.weight_chart");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return list;
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
		
}

