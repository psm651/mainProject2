package com.wthealth.service.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;

public interface MainService {

	public Map<String, Object> listSearchMain(Search search) throws Exception;
	
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void updateThumbnail(Post post) throws Exception;
	
	public void updateYoutubeThumbnail(Post post) throws Exception;
}
