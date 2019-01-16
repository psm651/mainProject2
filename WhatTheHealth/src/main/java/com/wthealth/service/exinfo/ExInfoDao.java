package com.wthealth.service.exinfo;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface ExInfoDao {

	
	//운동정보게시물 등록
	public int addExInfo(Post post) throws Exception;
	
	//게시물 등록
	public void addPost(Post post) throws Exception;

	//운동정보게시물 업데이트
	public void updateExInfo(Post post) throws Exception;
	
	//게시물 업데이트
	public void updatePost(Post post) throws Exception;
	
	public Post getExInfo(String postNo) throws Exception;

	public List<Post> listExInfo(Search search) throws Exception;

	//API 확인 
	public List<Post> listExInfo(String Weather) throws Exception;

	public int getTotalCount(Search search) throws Exception;

}
