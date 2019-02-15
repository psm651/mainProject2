package com.wthealth.service.exschedule;

import java.util.List;

import com.wthealth.domain.ExSchedule;
import com.wthealth.domain.Post;

public interface ExScheduleService {
	
	public void addExSchedule(ExSchedule exSchedule) throws Exception;
	
	public ExSchedule getExSchedule(int exScNo) throws Exception;
	
	public int updateExSchedule(ExSchedule exSchedule) throws Exception; 
	
	public List<ExSchedule> listExSchedule(String userId) throws Exception;
	
	public List<ExSchedule> getExHistoryChart(String userId) throws Exception;
	
	public int deleteExSchedule(int exScNo) throws Exception; 

	public void addPostExSchedule(ExSchedule exSchedule) throws Exception;
}
