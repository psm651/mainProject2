package com.wthealth.service.exschedule.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.domain.ExSchedule;
import com.wthealth.service.exschedule.ExScheduleDao;
@Repository("exScheduleDaoImpl")
public class ExScheduleDaoImpl implements ExScheduleDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ExScheduleDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public int addExSchedule(ExSchedule exSchedule) throws Exception {
		return sqlSession.insert("ExScMapper.addExSchedule", exSchedule);
		
	}

	@Override
	public ExSchedule getExSchedule(int exScNo) throws Exception {
		return sqlSession.selectOne("ExScMapper.getExSchedule", exScNo);		
	}

	@Override
	public int updateExSchedule(ExSchedule exSchedule) throws Exception {
		return sqlSession.update("ExScMapper.updateExSchedule", exSchedule);
		
	}

	@Override
	public void listExSchedule(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getExHistoryChart(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteExSchedule(int exScNo) throws Exception {
		sqlSession.update("ExScMapper.deleteExSchedule", exScNo);		
	}

}
