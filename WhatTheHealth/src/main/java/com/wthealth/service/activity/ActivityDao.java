package com.wthealth.service.activity;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ActivityDao {

	public List<Post> listMyPost(Search search, String postId) throws Exception ;
	
	public int getTotalCount(String postId) throws Exception ;


}
