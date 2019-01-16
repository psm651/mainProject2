package com.wthealth.service.hashtag;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.HashTag;

public interface HashTagDao {

	public void addHashTag(HashTag hashTag) throws Exception;
	
	public List<HashTag> listHashTag(Search search) throws Exception; 
	
	public void updateHashTag(List<HashTag> hashTag) throws Exception;

	public void deleteHashTag(int postNo);

	
	
}
