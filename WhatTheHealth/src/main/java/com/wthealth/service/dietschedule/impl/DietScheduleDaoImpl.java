package com.wthealth.service.dietschedule.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.domain.BMI;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.service.dietschedule.DietScheduleDao;
@Repository("dietScheduleDaoImpl")
public class DietScheduleDaoImpl implements DietScheduleDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	} 
	
	///Constructor
	public DietScheduleDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	
	@Override
	public DietSchedule getDietSchedule(int dietScNo) throws Exception {
		return sqlSession.selectOne("DietScMapper.getDietSchedule", dietScNo);
		
	}
 
	@Override
	public List<DietSchedule> listDietSchedule(String userId) throws Exception {
		return sqlSession.selectList("DietScMapper.listDietSchedule", userId);
	}

	@Override
	public void updateDietSchedule(DietSchedule dietSchedule) throws Exception {
		sqlSession.update("DietScMapper.updateDietSchedule", dietSchedule);
		sqlSession.delete("DietScMapper.deleteMeal", dietSchedule.getDietScNo());
		for (int i = 0; i < dietSchedule.getFood().size(); i++) {
			Food food = dietSchedule.getFood().get(i);
			sqlSession.insert("DietScMapper.addMeal", food);
		}
		
	}

	/*@Override
	public int addDietSchedule(DietSchedule dietSchedule) throws Exception {
		return sqlSession.insert("DietScMapper.addDietSchedule", dietSchedule);
		 //sqlSession.selectOne("DietScMapper.getDietSchedleNo", dietSchedule);
	}*/
	@Override
	public int addDietSchedule(DietSchedule dietSchedule) throws Exception {
		return sqlSession.insert("DietScMapper.addDietSchedule", dietSchedule);
		 //sqlSession.selectOne("DietScMapper.getDietSchedleNo", dietSchedule);
	}


	@Override
	public void deleteDietSchedule(int dietScNo) throws Exception {
		sqlSession.update("DietScMapper.deleteDietSchedule", dietScNo);
		
	}
	
	@Override
	public void getDietHistoryChart(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void addBmi(BMI bmi) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int addMeal(Food food) throws Exception {
	
		return sqlSession.insert("DietScMapper.addMeal", food);
	}

	@Override
	public DietSchedule getDietScNo(DietSchedule dietSchedule) {
		
		return sqlSession.selectOne("DietScMapper.getDietScNo", dietSchedule);
	}

}
