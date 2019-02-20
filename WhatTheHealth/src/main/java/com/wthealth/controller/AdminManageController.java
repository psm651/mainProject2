package com.wthealth.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.adminmanage.AdminManageService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/adminManage/*")
public class AdminManageController {

	//Field
	@Autowired
	@Qualifier("adminManageServiceImpl")
	private AdminManageService adminManageService;
	
	public AdminManageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="listUserAdminManage")
	public String listUserAdminManage(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Business Logic
		Map<String, Object> map = adminManageService.listUserAdminManage(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(search);
		//MV
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/adminmanage/listUserAdminManage.jsp";
	}
	
	@RequestMapping(value="listPointAdminManage")
	public String listPointAdminManage(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Business Logic
		Map<String, Object> map = adminManageService.listPointAdminManage(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		//MV
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/adminmanage/listPointAdminManage.jsp";
	}                               
	
	@RequestMapping(value="getUserAdminManage", method=RequestMethod.GET)
	public String getUserAdminManage(@RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println(userId);
		User user = adminManageService.getAdminManage(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/adminmanage/getUserAdminManage.jsp";
	}
	


	@RequestMapping(value="updateUserAdminManage", method=RequestMethod.POST)
	public String updateUserAdminManage(@ModelAttribute("user") User user, @RequestParam("originalFileName") MultipartFile uploadFile) throws Exception{
		
		System.out.println("updateUserAdminManage");

		if(uploadFile.getOriginalFilename()!=null) {
			user.setUserImage(uploadFile.getOriginalFilename());
			
		}else{
			String path = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\userImage\\";
			File file = new File(path, uploadFile.getOriginalFilename());
			uploadFile.transferTo(file);
			user.setUserImage(uploadFile.getOriginalFilename());
		}
			adminManageService.updateUserAdminManage(user);
	
		return "redirect:/adminManage/getUserAdminManage?userId="+user.getUserId();
		
	}	

	@RequestMapping(value="updateUserAdminManage", method=RequestMethod.GET)
	public String updateUserAdminManage(@RequestParam String userId, Model model) throws Exception{
		
		System.out.println("updateUserAdminManage�쓽 userId : "+userId);
		
		User user = adminManageService.getAdminManage(userId);
	
		model.addAttribute("user", user);
		
		return "forward:/adminmanage/updateUserAdminManage.jsp";
	}	
}
