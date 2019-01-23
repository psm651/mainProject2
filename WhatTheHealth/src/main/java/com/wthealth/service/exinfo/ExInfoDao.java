package com.wthealth.service.exinfo;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExInfoDao {

	
	public void addExInfo(Post post) throws Exception;
	
	
	public void updateExInfo(Post post) throws Exception;

	
	public Post getExInfo(int postNo) throws Exception;

	public List<Post> listExInfo(Search search) throws Exception;

	
	public List<Post> listExInfo(String Weather) throws Exception;

	public int getTotalCount(Search search) throws Exception;

}
