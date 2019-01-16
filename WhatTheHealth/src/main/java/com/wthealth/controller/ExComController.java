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
import com.wthealth.domain.Post;
import com.wthealth.service.excom.ExComService;

@Controller
@RequestMapping("/excom/*")
public class ExComController {
	
	@Autowired
	@Qualifier("exComServiceImpl")
	private ExComService exComService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public ExComController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "addExCom", method = RequestMethod.GET)
	public String addExCom() throws Exception{
		System.out.println("addExCom : GET");
					 
		return "redirect:/excom/addExCom.jsp";
	}
	
	@RequestMapping(value = "addExCom", method = RequestMethod.POST)
	public String addExCom(@ModelAttribute("post") Post post) throws Exception{
		System.out.println("/addExCom : POST");
		
		exComService.addExCom(post);
		
		return "forward:/excom/getExCom?postNo"+post.getPostNo();
	}
	
	@RequestMapping(value = "getExCom", method = RequestMethod.GET)
	public String getExCom(@RequestParam("postNo") String postNo, Model model) throws Exception{
		System.out.println("/getExCom :GET");
		
		Post post = exComService.getExCom(postNo);
		model.addAttribute("post",post);
		
		return "forward:/excom/getExCom.jsp";
	}
	
	@RequestMapping(value = "updateExCom", method= RequestMethod.GET)
	public String updateExCom(@ModelAttribute("post") Post post) throws Exception{
		System.out.println("/updateExCom");
		
		exComService.updateExCom(post);
		
		return "redirect:/excom/updateExCom?postNo="+post.getPostNo();
	}
	
	@RequestMapping(value="deleteExCom", method = RequestMethod.POST)
	public String deleteExCom(@RequestParam("post") String postNo, Model model) throws Exception{
		System.out.println("/deleteExCom : POST");
		
		exComService.deleteExCom(postNo);
		
		return "redirect:/excom/listExCom.jsp";
	}
	
	@RequestMapping(value="listExCom")
	public String listExCom(@ModelAttribute("search")Search search, Model model) throws Exception{
		System.out.println("/listExCom");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = exComService.listExCom(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/excom/listExCom.jsp";
	}
	
	@RequestMapping(value="listExComRecom")
	public String listExComRecom(@ModelAttribute("search")Search search, Model model) throws Exception{
		System.out.println("/listExComRecom");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = exComService.listExComRecom(search);
		

		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/excom/listExComRecom.jsp";
	}
}
