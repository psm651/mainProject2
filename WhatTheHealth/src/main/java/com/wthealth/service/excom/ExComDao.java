package com.wthealth.service.excom;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExComDao {

	public void addExCom(Post post) throws Exception;
	
	public Post getExCom(String postNo) throws Exception;

	public List<Post> listExCom(Search search) throws Exception;

	public void updateExCom(Post post) throws Exception;

	public void deleteExCom(String postNo) throws Exception;

	public List<Post> listExComRecom(Search search) throws Exception;

	// 게시판 Page 처리를 위한 전체Row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
}
