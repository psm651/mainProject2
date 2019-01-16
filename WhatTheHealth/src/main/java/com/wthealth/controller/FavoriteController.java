package com.wthealth.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.service.favorite.FavoriteService;

@Controller
@RequestMapping("/activity/*")
public class FavoriteController {
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
	public FavoriteController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "listMyInterest")
	public String listMyInterest(@ModelAttribute("search")Search search, @RequestParam("userId") String userId, Model model) throws Exception{
		System.out.println("/listMyInterest");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = favoriteService.listMyInterest(search, userId);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("userId", map.get("userId"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/activity/listMyInterest.jsp";
	}
	
}
