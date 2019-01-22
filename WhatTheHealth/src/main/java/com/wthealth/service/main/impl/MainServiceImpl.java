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
	      String realFolder = "C:\\Users\\Bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\upload";
	      System.out.println(realFolder);
	      UUID uuid = UUID.randomUUID();

	   // 업로드할 파일 이름
	      String orgFileName = file.getOriginalFilename();
	      String strFileName = uuid.toString() + orgFileName;

	      System.out.println("���� ���ϸ� : " + orgFileName);
	      System.out.println("������ ���ϸ� : " + strFileName);

	      String filepath = realFolder + "\\" + strFileName;
	      System.out.println("���ϰ�� : " + filepath);

	      File f = new File(filepath);
	      if (!f.exists()) {
	         f.mkdirs();
	      }
	      file.transferTo(f);
	      out.print("http://127.0.0.1:8080/resources/images/upload/"+strFileName);
	      out.close();
		      

		
	}

}
