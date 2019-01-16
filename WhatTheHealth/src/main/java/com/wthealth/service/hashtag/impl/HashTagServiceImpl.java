package com.wthealth.service.hashtag.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.HashTag;
import com.wthealth.service.hashtag.HashTagDao;
import com.wthealth.service.hashtag.HashTagService;

@Service("hashTagServiceImpl")
public class HashTagServiceImpl implements HashTagService {

	///Field
	@Autowired
	@Qualifier("hashTagDaoImpl")
	private HashTagDao hashTagDao;
	
	public void setHashTagDao(HashTagDao hashTagDao) {
		this.hashTagDao = hashTagDao;
	}
	///Constructor
	public HashTagServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	
	@Override
	public void addHashTag(HashTag hashTag) throws Exception {
		hashTagDao.addHashTag(hashTag);
	}
	
	@Override
	public Map<String , Object > listHashTag(Search search) throws Exception {
		 List<HashTag> list = hashTagDao.listHashTag(search);
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("list", list);
		return map;
		
	}
	@Override
	public void updateHashTag(List<HashTag> hashTag) throws Exception {
		hashTagDao.updateHashTag(hashTag);
		
	}
	@Override
	public void deleteHashTag(int postNo) throws Exception {
		hashTagDao.deleteHashTag(postNo);
		
	}

}
