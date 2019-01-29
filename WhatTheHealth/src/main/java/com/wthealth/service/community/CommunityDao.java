package com.wthealth.service.community;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface CommunityDao {

	public void addExCom(Post post) throws Exception;
	
	public void addDietCom(Post post) throws Exception;
	
	public Post getCommunity(int postNo) throws Exception;
	
	public List<Post> listExCom(Search search) throws Exception;
	
	public List<Post> listDietCom(Search search) throws Exception;

	public void updateCommunity(Post post) throws Exception;
	
	public void updateClickCount(Post post) throws Exception;
	
	public void updateLikeCount(Post post) throws Exception;
	
	public void deleteCommunity(int postNo) throws Exception;
	
	public List<Post> listDietComRecom(Search search) throws Exception;
	
	public List<Post> listExComRecom(Search search) throws Exception;

	// 게시판 Page 처리를 위한 전체Row(totalCount) return
	public int getTotalCountForDC(Search search) throws Exception;
	
	public int getTotalCountForEC(Search search) throws Exception;
}
