package com.wthealth.service.adminmanage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.adminmanage.AdminManageDao;
import com.wthealth.service.adminmanage.AdminManageService;


@Service("adminManageServiceImpl")
public class AdminManageServiceImpl implements AdminManageService {

	//Field
	@Autowired
	@Qualifier("adminManageDaoImpl")
	private AdminManageDao adminManageDao;
	public void setAdminManageDao(AdminManageDao adminManageDao) {
		this.adminManageDao = adminManageDao;
	}
	
	//Constructor
	public AdminManageServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Map<String, Object> listUserAdminManage(Search search) throws Exception {

		List<User> list = adminManageDao.listUserAdminManage(search);
		int totalCount = adminManageDao.getUserTotalCount(search);
		
		System.out.println("serviceImpl totalCount : "+ totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public User getAdminManage(String userId) throws Exception {
		User user = adminManageDao.getAdminManage(userId);
		return user;
	}

	@Override
	public void updateUserAdminManage(User user) throws Exception {
		adminManageDao.updateUserAdminManage(user);
		
	}

	@Override
	public Map<String, Object> listPointAdminManage(Search search) throws Exception {
		
		List<Point> list = adminManageDao.listPointAdminManage(search);
		
		int totalCount = adminManageDao.getPointTotalCount(search);
		
		System.out.println("serviceImpl totalCount : "+ totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}


	

}
