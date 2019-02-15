package com.wthealth.service.exschedule.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.domain.ExSchedule;
import com.wthealth.domain.Post;
import com.wthealth.service.exschedule.ExScheduleDao;
import com.wthealth.service.exschedule.ExScheduleService;

@Service("exScheduleServiceImpl")
public class ExScheduleServiceImpl implements ExScheduleService {

	///Field
	@Autowired
	@Qualifier("exScheduleDaoImpl")
	private ExScheduleDao exScheduleDao;
	 
	
	///Constructor
	public void setExScheduleDao(ExScheduleDao exScheduleDao) {
		this.exScheduleDao = exScheduleDao;
	}

	public ExScheduleServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addExSchedule(ExSchedule exSchedule) throws Exception {
		
		 exScheduleDao.addExSchedule(exSchedule);
	
	}

	@Override
	public ExSchedule getExSchedule(int exScNo) throws Exception {
		return exScheduleDao.getExSchedule(exScNo);		
	}

	@Override
	public int updateExSchedule(ExSchedule exSchedule) throws Exception {
		return exScheduleDao.updateExSchedule(exSchedule);
		
	}

	@Override
	public List<ExSchedule> listExSchedule(String userId) throws Exception {
		return exScheduleDao.listExSchedule(userId);
		
	}

	@Override
	public List<ExSchedule> getExHistoryChart(String userId) throws Exception {
		return exScheduleDao.listExSchedule(userId);
		
	}

	@Override
	public int deleteExSchedule(int exScNo) throws Exception {
		return exScheduleDao.deleteExSchedule(exScNo);
		
	}

	@Override
	public void addPostExSchedule(ExSchedule exSchedule) throws Exception {
		exScheduleDao.addPostExSchedule(exSchedule);
		
	}

}
