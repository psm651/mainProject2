package com.wthealth.service.dietschedule;

import java.util.List;

import com.wthealth.domain.BMI;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;

public interface DietScheduleDao {
	
	public DietSchedule getDietSchedule(int dietScNo) throws Exception;
	
	public List<DietSchedule> listDietSchedule(String userId) throws Exception;
	
	public void updateDietSchedule(DietSchedule dietSchedule) throws Exception;
	
	public int addDietSchedule(DietSchedule dietSchedule) throws Exception;
	
	
	public void deleteDietSchedule(int dietScNo) throws Exception;
	
	public void getDietHistoryChart(String userId) throws Exception;
	
	public void addBmi(BMI bmi) throws Exception;

	public DietSchedule getDietScNo(DietSchedule dietSchedule);

	public int addMeal(Food food) throws Exception; 

}