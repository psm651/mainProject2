package com.wthealth.service.locationtag.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.service.locationtag.LocationTagDao;

@Repository("locationTagDaoImpl")
public class LocationTagDaoImpl implements LocationTagDao {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}	
	
	//Constructor
	public LocationTagDaoImpl() {
		System.out.println(this.getClass());
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
