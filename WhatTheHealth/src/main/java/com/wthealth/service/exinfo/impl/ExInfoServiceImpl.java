package com.wthealth.service.exinfo.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.exinfo.ExInfoDao;
import com.wthealth.service.exinfo.ExInfoService;


@Service("exInfoServiceImpl")
public class ExInfoServiceImpl implements ExInfoService {

	//Field
	@Autowired
	@Qualifier("exInfoDaoImpl")
	private ExInfoDao exInfoDao;
	public void setExInfoDao(ExInfoDao exInfoDao) {
		this.exInfoDao = exInfoDao;
	}
	
	//Constructor
	public ExInfoServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public int addExInfo(Post post) throws Exception {
		return exInfoDao.addExInfo(post);
	}
	
	@Override
	public void addPost(Post post) throws Exception{
		exInfoDao.addPost(post);
	}
	
	@Override
	public void updateExInfo(Post post) throws Exception {
		exInfoDao.updateExInfo(post);
	}
	
	@Override
	public void updatePost(Post post) throws Exception {
		exInfoDao.updatePost(post);
	}

	@Override
	public Post getExInfo(String postNo) throws Exception {
		return exInfoDao.getExInfo(postNo);
	}

	@Override
	public Map<String, Object> listExInfo(Search search) throws Exception {
		
		List<Post> list = exInfoDao.listExInfo(search);
		
		int totalCount = exInfoDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	@Override
	public List<Post> listExInfo(String Weather) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
