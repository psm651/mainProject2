package com.wthealth.service.activity;

import java.util.Map;

import com.wthealth.common.Search;

public interface ActivityService {
	
	public Map<String , Object> listMyPost(Search search, String postId) throws Exception ;

}