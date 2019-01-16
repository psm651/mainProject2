package com.wthealth.service.excom;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExComService {
	
	public void addExCom(Post post) throws Exception;
	
	public Post getExCom(String postNo) throws Exception;

	public Map<String, Object> listExCom(Search search) throws Exception;

	public void updateExCom(Post post) throws Exception;

	public void deleteExCom(String postNo) throws Exception;

	public Map<String, Object> listExComRecom(Search search) throws Exception;
}
