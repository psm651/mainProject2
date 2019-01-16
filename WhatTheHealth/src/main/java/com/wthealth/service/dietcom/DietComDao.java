package com.wthealth.service.dietcom;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface DietComDao {

	public void addDietCom(Post post) throws Exception;
	
	public Post getDietCom(String postNo) throws Exception;
	
	public List<Post> listDietCom(Search search) throws Exception;

	public void updateDietCom(Post post) throws Exception;

	public void deleteDietCom(String postNo) throws Exception;
	
	public List<Post> listDietComRecom(Search search) throws Exception;

	// �Խ��� Page ó���� ���� ��üRow(totalCount) return
	public int getTotalCount(Search search) throws Exception;
}
