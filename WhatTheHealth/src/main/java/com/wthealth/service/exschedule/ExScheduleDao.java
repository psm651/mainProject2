package com.wthealth.service.exschedule;

import com.wthealth.domain.ExSchedule;

public interface ExScheduleDao {

	public int addExSchedule(ExSchedule exSchedule) throws Exception;
	
	public ExSchedule getExSchedule(int exScNo) throws Exception;
	
	public int updateExSchedule(ExSchedule exSchedule) throws Exception; 
	
	public void listExSchedule(String userId) throws Exception;
	
	public void getExHistoryChart(String userId) throws Exception;
	
	public void deleteExSchedule(int exScNo) throws Exception; 
}
