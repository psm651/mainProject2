package com.wthealth.service.hashtag;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.HashTag;

public interface HashTagService {

	public void addHashTag(HashTag hashTag) throws Exception;
	
	public Map<String, Object> listHashTag(Search search) throws Exception; 
	
	public void updateHashTag(List<HashTag> hashTag) throws Exception;

	public void deleteHashTag(int postNo) throws Exception;
	
}
