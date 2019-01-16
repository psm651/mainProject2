package com.wthealth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.batch.Main;
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
import com.wthealth.service.dietcom.DietComService;
import com.wthealth.service.excom.ExComService;
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.main.MainService;
import com.wthealth.service.meeting.MeetingService;

@Controller
@RequestMapping("/")
public class MainController {

	//Field
	@Autowired
	@Qualifier("mainServiceImpl")
	private MainService mainService;
	@Autowired
	@Qualifier("exInfoServiceImpl")
	private ExInfoService exInfoService;
	@Autowired
	@Qualifier("exComServiceImpl")
	private ExComService exComService;
	@Autowired
	@Qualifier("dietComServiceImpl")
	private DietComService dietComService;
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	
	public MainController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
		int pageUnit;	

	@Value("#{commonProperties['pageSize']}")
		int pageSize;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String getMainPage(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("MainController Come in");
		//?Ç†?î®Î≥? Ï∂îÏ≤ú?ö¥?èô, ?ãù?ã®/?ö¥?èô Ï∂îÏ≤ú, ?ûÑÎ∞ïÌïú ?ÜåÎ™®ÏûÑ Business Logic
/*		Map<String, Object> ex= exComService.listExComRecom(search);	
		Map<String, Object> diet = dietComService.listDietComRecom(search);
		Map<String, Object> meeting = meetingService.listMeeting(search);
		List<Post> exInfo = exInfoService.listExInfo(Weather);*/
		
		
		
/*		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);*/
		
		
		
		return "main.jsp" ;
	}
	
	@RequestMapping(value="listSearchMain", method=RequestMethod.GET)
	public String listSearchMain(@ModelAttribute Search search, Model model) throws Exception{
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(1);
		
		//Business Logic
		Map<String, Object> map = mainService.listSearchMain(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		//MV
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/main/listSearchMain.jsp";
			
	}
	

	
}
