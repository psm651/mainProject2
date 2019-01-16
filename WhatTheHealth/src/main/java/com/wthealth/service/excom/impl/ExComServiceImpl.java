package com.wthealth.service.excom.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.excom.ExComDao;
import com.wthealth.service.excom.ExComService;

@Service("exComServiceImpl")
public class ExComServiceImpl implements ExComService {

	@Autowired
	@Qualifier("exComDaoImpl")
	private ExComDao exComDao;
	public void setDietComDao(ExComDao exComDao) {
		this.exComDao = exComDao;
	}
	
	public ExComServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addExCom(Post post) throws Exception {
		exComDao.addExCom(post);
	}

	@Override
	public Post getExCom(String postNo) throws Exception {
		return exComDao.getExCom(postNo);
	}

	@Override
	public Map<String, Object> listExCom(Search search) throws Exception {
		List<Post> list = exComDao.listExCom(search);
		int totalCount = exComDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public void updateExCom(Post post) throws Exception {
		exComDao.updateExCom(post);

	}

	@Override
	public void deleteExCom(String postNo) throws Exception {
		exComDao.deleteExCom(postNo);
	}

	@Override
	public Map<String, Object> listExComRecom(Search search) throws Exception {
		List<Post> recommendList = exComDao.listExComRecom(search);
		int totalCount = exComDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendList", recommendList);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}

}
