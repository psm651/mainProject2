package com.wthealth.service.activity.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.activity.ActivityDao;
import com.wthealth.service.activity.ActivityService;

@Service("activityServiceImpl")
public class ActivityServiceImpl implements ActivityService {
	
	///Field
	@Autowired
	@Qualifier("activityDaoImpl")
	private ActivityDao activityDao;
	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	public ActivityServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}


	@Override
	public Map<String, Object> listMyPost(Search search, String postId) throws Exception {
		// TODO Auto-generated method stub
		List<Post> list= activityDao.listMyPost(search, postId);
		int totalCount = activityDao.getTotalCount(postId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
