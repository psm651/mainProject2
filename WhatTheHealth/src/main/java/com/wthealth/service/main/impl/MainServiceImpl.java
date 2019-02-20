package com.wthealth.service.main.impl;

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
import com.wthealth.service.main.MainDao;
import com.wthealth.service.main.MainService;

@Service("mainServiceImpl")
public class MainServiceImpl implements MainService {
	
	//Field
	@Autowired
	@Qualifier("mainDaoImpl")
	private MainDao mainDao;
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}

	//Constructor
	public MainServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Map<String, Object> listSearchMain(Search search) throws Exception {
		
		List<Post> list = mainDao.listSearchMain(search);
		
		int totalCount = mainDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		map.put("search", search);
		
		return map;
	}

	@Override
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
	      response.setContentType("text/html;charset=utf-8");
		  PrintWriter out = response.getWriter();

	     //String realFolder = request.getSession().getServletContext().getRealPath("images");

	      String realFolder = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\upload";

	      System.out.println(realFolder);
	      UUID uuid = UUID.randomUUID();

	   // 업로드할 파일 이름
	      String orgFileName = file.getOriginalFilename();
	      String strFileName = uuid.toString() + orgFileName;

	      System.out.println("원본 파일명 : " + orgFileName);
	      System.out.println("저장할 파일명: " + strFileName);

	      String filepath = realFolder + "\\" + strFileName;
	      System.out.println("파일경로 : " + filepath);

	      File f = new File(filepath);
	      if (!f.exists()) {
	         f.mkdirs();
	      }
	      file.transferTo(f);
	      out.print("http://192.168.0.40:8080/resources/images/upload/"+strFileName);
	      out.close();
	}
	
	@Override
	public void updateThumbnail(Post post) throws Exception {
		String contents = post.getContents();
		String photoName = contents.split("upload/")[1];
		
		photoName = photoName.split(">")[0];
		
		post.setPhoto(photoName);
		
		mainDao.updateThumbnail(post);
			
	}

	@Override
	public void updateYoutubeThumbnail(Post post) throws Exception {
		String contents = post.getContents();
		String photoName = contents.split("embed/")[1];
		
		photoName = photoName.split("\"")[0];
		System.out.println("photoName"+photoName);
		
		String front = "https://i.ytimg.com/vi/";
		String back = "/mqdefault.jpg";
		
		post.setPhoto(front +photoName+ back);
		post.setYoutube(photoName);
		
		mainDao.updateThumbnail(post);
		
	}
	

}
