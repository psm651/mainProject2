package com.wthealth.service.main;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface MainDao {

	public List<Post> listSearchMain(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
}
