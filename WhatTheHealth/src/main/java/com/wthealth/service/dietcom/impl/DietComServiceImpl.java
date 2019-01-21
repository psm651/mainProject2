package com.wthealth.service.dietcom.impl;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.dietcom.DietComDao;
import com.wthealth.service.dietcom.DietComService;

@Service("dietComServiceImpl")
public class DietComServiceImpl implements DietComService {

	@Autowired
	@Qualifier("dietComDaoImpl")
	private DietComDao dietComDao;
	public void setDietComDao(DietComDao dietComDao) {
		this.dietComDao = dietComDao;
	}
	
	public DietComServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addDietCom(Post post) throws Exception {
		dietComDao.addDietCom(post);
	}
	
	@Override
	public Post getDietCom(String postNo) throws Exception {
		return dietComDao.getDietCom(postNo);
	}


	@Override
	public Map<String, Object> listDietCom(Search search) throws Exception {
		List<Post> list = dietComDao.listDietCom(search);
		int totalCount = dietComDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public void updateDietCom(Post post) throws Exception {
		dietComDao.updateDietCom(post);

	}

	@Override
	public void updateClickCount(Post post) throws Exception {
		dietComDao.updateClickCount(post);
	}
	
	@Override
	public void updateLikeCount(Post post) throws Exception {
		dietComDao.updateLikeCount(post);
	}

	@Override
	public void updateThumbnail(Post post) throws Exception {
		String contents = post.getContents();
		String photoName = contents.split("upload/")[1];
		photoName = photoName.split(">")[0];
		
		post.setPhoto(photoName);
		
		dietComDao.updateThumbnail(post);
		
	}

	@Override
	public void deleteDietCom(String postNo) throws Exception {
		dietComDao.deleteDietCom(postNo);

	}

	@Override
	public Map<String, Object> listDietComRecom(Search search) throws Exception {
		List<Post> list = dietComDao.listDietComRecom(search);
		int totalCount = dietComDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
		
	}

}
