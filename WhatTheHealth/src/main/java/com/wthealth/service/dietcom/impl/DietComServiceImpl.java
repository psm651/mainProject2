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
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		//String realFolder = request.getSession().getServletContext().getRealPath("images");
		String realFolder = "C:\\Users\\Bit\\git\\WhatTheHealth\\WhatTheHealth\\WebContent\\resources\\images\\upload";
		System.out.println(realFolder);
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String orgFileName = file.getOriginalFilename();
		String strFileName = uuid.toString() + orgFileName;

		System.out.println("원본 파일명 : " + orgFileName);
		System.out.println("저장할 파일명 : " + strFileName);

		String filepath = realFolder + "\\" + strFileName;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.print("/resources/images/upload/"+strFileName);
		out.close();
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
