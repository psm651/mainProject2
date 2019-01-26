package com.wthealth.service.community;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface CommunityService {

	public void addExCom(Post post) throws Exception;
	
	public void addDietCom(Post post) throws Exception;
	
	public Post getCommunity(int postNo) throws Exception;

	public Map<String, Object> listExCom(Search search) throws Exception;
	
	public Map<String, Object> listDietCom(Search search) throws Exception;

	public void updateCommunity(Post post) throws Exception;
	
	public void updateClickCount(Post post) throws Exception;
	
	public void updateLikeCount(Post post) throws Exception;
	
	public void deleteCommunity(int postNo) throws Exception;

	public Map<String, Object> listDietComRecom(Search search) throws Exception;
	
	public Map<String, Object> listExComRecom(Search search) throws Exception;
	
}
