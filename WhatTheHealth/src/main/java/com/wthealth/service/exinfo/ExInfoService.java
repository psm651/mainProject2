package com.wthealth.service.exinfo;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExInfoService {

	
	public void addExInfo(Post post) throws Exception;
		
	public Post getExInfo(int postNo) throws Exception;
	
	public void updateExInfo(Post post) throws Exception;
	
	public Map<String, Object> listExInfo(Search search) throws Exception;
	
	public Map<String, Object> listWeatherRecom(String cityName) throws Exception;
	
	public void deleteStatus(String postNo) throws Exception;
	
    public Map<String, Object> listExInfoRecom(Search search) throws Exception;
	
}
