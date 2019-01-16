package com.wthealth.service.dietcom;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface DietComService {

	public void addDietCom(Post post) throws Exception;
	
	public Post getDietCom(String postNo) throws Exception;

	public Map<String, Object> listDietCom(Search search) throws Exception;

	public void updateDietCom(Post post) throws Exception;
	
	public void deleteDietCom(String postNo) throws Exception;

	public Map<String, Object> listDietComRecom(Search search) throws Exception;
	
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
