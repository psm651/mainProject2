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
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.domain.Post;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.main.MainService;

@Controller
@RequestMapping("/exInfo/*")
public class ExInfoController {

	//Field
	@Autowired
	@Qualifier("exInfoServiceImpl")
	private ExInfoService exInfoService;
	
		
	@Autowired
	@Qualifier("mainServiceImpl")
	private MainService mainService;
	
	public ExInfoController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addExInfo", method=RequestMethod.POST)
	public String addExInfo(@ModelAttribute("post") Post post) throws Exception{
		
			//Business Logic
			exInfoService.addExInfo(post);
			
			if(post.getContents().indexOf("upload/") != -1) {
				mainService.updateThumbnail(post);
			}else if(post.getContents().indexOf("embed/") != -1){
				mainService.updateYoutubeThumbnail(post);
			}
		return "redirect:/exInfo/getExInfo?postNo="+post.getPostNo();
	}
	
	@RequestMapping(value="getExInfo", method=RequestMethod.GET)
	public String getExInfo(@RequestParam("postNo") int postNo, Model model) throws Exception {
		
   

		
		Post post = exInfoService.getExInfo(postNo);
        String contents = post.getContents();
        post.setContents(contents.substring(1));
        
		model.addAttribute("post", post);
				
		return "forward:/exinfo/getExInfo.jsp"; 
	}
	
	@RequestMapping(value="updateExInfo", method=RequestMethod.GET)
	public String updateExInfo(@RequestParam("postNo") int postNo, Model model) throws Exception {

		System.out.println(postNo);
		Post post = exInfoService.getExInfo(postNo);
		
		model.addAttribute("post", post);
	
		return "forward:/exinfo/updateExInfo.jsp";
	}
	
	@RequestMapping(value="updateExInfo", method=RequestMethod.POST)
	public String updateExInfo(@ModelAttribute("post") Post post, Model model) throws Exception {

		exInfoService.updateExInfo(post);
			
		if(post.getContents().indexOf("upload/") != -1) {
			mainService.updateThumbnail(post);
		}else if(post.getContents().indexOf("embed/") != -1){
			mainService.updateYoutubeThumbnail(post);
		}
		
		return "redirect:/exInfo/getExInfo?postNo="+post.getPostNo();
	}	
	@RequestMapping(value="listExInfo")
	public String listExInfo(@ModelAttribute("search") Search search, Model model) throws Exception{
	
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
	
		//Business Logic
		Map<String, Object> map = exInfoService.listExInfo(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(map.get("list"));
		//MV
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
				
		return "forward:/exinfo/listExInfo.jsp";
	}
	
	@RequestMapping(value="updateDeleteStatus", method=RequestMethod.GET)
	public String updateDeleteStatus(@RequestParam("postNo") String postNo) throws Exception {
		
		exInfoService.deleteStatus(postNo);
		
		return "redirect:/exInfo/listExInfo";
	}
	


}
