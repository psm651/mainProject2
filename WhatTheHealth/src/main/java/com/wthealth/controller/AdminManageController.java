package com.wthealth.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.adminmanage.AdminManageService;

@Controller
@RequestMapping("/adminmanage/*")
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
		
		
		return "forward:/adminmanage/listPointAmdinManage.jsp";
	}
	
	@RequestMapping(value="getAdminManage", method=RequestMethod.GET)
	public String getAdminManage(@RequestParam("userId") String userId, Model model) throws Exception{
		
		User user = adminManageService.getAdminManage(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/adminmanage/getAdminManage.jsp";
	}
	
	@RequestMapping(value="updateUserAdminManage", method=RequestMethod.POST)
	public String updateUserAdminManage(@ModelAttribute("user") User user, Model model) throws Exception{
		
		adminManageService.updateUserAdminManage(user);
		
		return "redirect:/adminmanage/getAdminManage?"+user.getUserId();
	}
	
}
