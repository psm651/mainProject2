package com.wthealth.service.exinfo;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExInfoService {

	
	public void addExInfo(Post post) throws Exception;
		
	public Post getExInfo(int postNo) throws Exception;
	
	public void updateExInfo(Post post) throws Exception;
	

	public void updatePost(Post post) throws Exception;
	
	public Map<String, Object> listExInfo(Search search) throws Exception;
	
	
	public List<Post> listExInfo(String Weather) throws Exception;
}
