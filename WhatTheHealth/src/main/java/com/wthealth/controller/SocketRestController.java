package com.wthealth.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Socket;
import com.wthealth.domain.User;
import com.wthealth.service.socket.SocketService;

@RestController
@RequestMapping("/socket/*")
public class SocketRestController {

	@Autowired
	@Qualifier("socketServiceImpl")
	private SocketService socketService;
	
	private String fileName;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public SocketRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addLiveStream", method=RequestMethod.POST)
	//public Map<String, Object> addReply(@RequestBody Reply reply, @PathVariable String postNo) throws Exception {
	public Socket addLiveStream(@RequestBody Socket socket, HttpSession session) throws Exception {
		System.out.println("json/addLiveStream : POST");
		User user = (User)session.getAttribute("user");
		socket.setBjId(user.getUserId());
		socketService.addLiveStream(socket);
		Socket socketAfter =  socketService.getLiveStream(socket.getSocketNo());
		
		//return socket.getSocketNo();
		return socketAfter;
	}
	
	
	@RequestMapping(value="json/uploadFile/",method=RequestMethod.POST)
	   public String uploadFile(MultipartHttpServletRequest multipartFile) throws Exception{
	      String path = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\chatImage\\";
	      System.out.println("json/uploadFile/:POST:::::파일업로드하는곳");
//	      Chat chat = new Chat();
//	      File file = new File(temDir, multipartFile.getOriginalFilename());
//	      multipartFile.transferTo(file);
//	      chat.setImageFile(multipartFile.getOriginalFilename());
	      
	        File dir = new File(path);
	        if(!dir.isDirectory()){
	            dir.mkdir();
	        }
	        Iterator<String> files = multipartFile.getFileNames();
	        System.out.println(files.hasNext());
	        
	        while(files.hasNext()){
	            String uploadFile = files.next();
	            MultipartFile mFile = multipartFile.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            System.out.println("실제 파일 이름 : " +fileName);
	           
	            try {
	                mFile.transferTo(new File(path,fileName));
	               
	            } catch (Exception e) {
	                e.printStackTrace();
	            }finally {
	            this.fileName = fileName;
	         }
	        }
	        return fileName;
	   }

	//무한스크롤 
	@RequestMapping(value="json/listLiveStream", method=RequestMethod.POST)
	public Map<String, Object> listLiveStream(@RequestBody Search search) throws Exception{
		
		System.out.println("json/listLiveStream"+search.getSearchKeyword());
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = socketService.listLiveStream(search);

		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}	
	
	
	
}
