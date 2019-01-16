package com.wthealth.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.activity.ActivityService;



@Controller
@RequestMapping("/activity/*")
public class ActivityController {
	
	///Field
		@Autowired
		@Qualifier("activityServiceImpl")
		private ActivityService activityService;
		//setter Method 구현 않음

	public ActivityController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="listMyPost" )
	public String listMyPost( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/activity/listMyPost : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String postId = ((User)session.getAttribute("user")).getUserId();
		
		// Business logic 수행
		Map<String , Object> map = activityService.listMyPost(search, postId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/activity/listActivity.jsp";
	}

}
