package com.wthealth.service.locationtag.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.service.locationtag.LocationTagDao;
import com.wthealth.service.locationtag.LocationTagService;

@Service("locationTagServiceImpl")
public class LocationTagServiceImpl implements LocationTagService {

	//Field
	@Autowired
	@Qualifier("locationTagDaoImpl")
	private LocationTagDao locationTagDao;
	public void setPurchaseDao(LocationTagDao locationTagDao) {
		this.locationTagDao = locationTagDao;
	}
	
	@Override
	public void addLocationTag() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getMarker() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocationTag() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
