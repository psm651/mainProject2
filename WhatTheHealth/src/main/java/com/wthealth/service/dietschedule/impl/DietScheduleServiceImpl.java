package com.wthealth.service.dietschedule.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.domain.BMI;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.service.dietschedule.DietScheduleDao;
import com.wthealth.service.dietschedule.DietScheduleService;

@Service("dietScheduleServiceImpl")
public class DietScheduleServiceImpl implements DietScheduleService {

	///Field
	@Autowired
	@Qualifier("dietScheduleDaoImpl")
	private DietScheduleDao dietScheduleDao;
	
	 
	///Constructor
	public void setDietScheduleDao(DietScheduleDao dietScheduleDao) {
		this.dietScheduleDao = dietScheduleDao;
	}

	public DietScheduleServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public int addDietSchedule(DietSchedule dietSchedule) throws Exception {
		return dietScheduleDao.addDietSchedule(dietSchedule);
		
	}

	@Override
	public DietSchedule getDietSchedule(int dietScNo) throws Exception {
		return dietScheduleDao.getDietSchedule(dietScNo);
		
		
	}

	@Override
	public Map<String, Object> listDietSchedule(String userId) throws Exception {
		List<DietSchedule> list =dietScheduleDao.listDietSchedule(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietSchedule", list);
		return map;
		
	}

	@Override
	public void updateDietSchedule(DietSchedule dietSchedule) throws Exception {
		dietScheduleDao.updateDietSchedule(dietSchedule);
		
	}

	@Override
	public void getDietHistoryChart(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDietSchedule(int dietScNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addBmi(BMI bmi) throws Exception {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public DietSchedule getDietScNo(DietSchedule dietSchedule) throws Exception {
		return dietScheduleDao.getDietScNo(dietSchedule);
	}

	@Override
	public int addMeal(Food food) throws Exception {
		return dietScheduleDao.addMeal(food);
		
	}

}
