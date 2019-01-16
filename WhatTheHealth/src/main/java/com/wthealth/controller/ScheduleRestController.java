package com.wthealth.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.ExSchedule;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exschedule.ExScheduleService;




//==> 회원관리 Controller
@RestController
@RequestMapping("/schedule/*")
public class ScheduleRestController {
	
	///Field
	///Field
		@Autowired
		@Qualifier("dietScheduleServiceImpl")
		private DietScheduleService dietScheduleService;
		
		@Autowired
		@Qualifier("exScheduleServiceImpl")	
		private ExScheduleService exScheduleService;
	//setter Method 구현 않음
		
	public ScheduleRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="json/addDietSchedule", method = RequestMethod.GET)
	public String addDietSchedule() throws Exception {

		System.out.println("/schedule/json/addDietSchedule : GET");
	
		
		return "redirect:/calculation/calorieCalculation.jsp";
	}
	
	@RequestMapping(value="json/addDietSchedule", method = RequestMethod.POST)
	public DietSchedule addDietSchedule( @RequestBody DietSchedule dietSchedule ) throws Exception {

		System.out.println("/schedule/json/dietSchedule : POST");
		//Business Logic
		DietSchedule dietSchedule1=new DietSchedule();
		if (dietScheduleService.addDietSchedule(dietSchedule)==1) {
			dietSchedule1=dietSchedule;
		}
	
		
		return dietSchedule1;
		
	}
	
	@RequestMapping(value="json/addExSchedule", method = RequestMethod.POST)
	public ExSchedule addExSchedule( @RequestBody ExSchedule exSchedule ) throws Exception {

		System.out.println("json/addExSchedule : POST");
		//Business Logic
		ExSchedule exSchedule1=new ExSchedule();
		if (exScheduleService.addExSchedule(exSchedule)==1) {
			exSchedule1=exSchedule;
		}
	
		
		return exSchedule1;
		
	}
	
	@RequestMapping(value="json/getExSchedule/{exScNo}", method = RequestMethod.GET)
	public ExSchedule getExSchedule( @PathVariable("exScNo") int exScNo,  HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("json/getExSchedule/{exScNo} : GET");
		//Business Logic
		ExSchedule exSchedule= exScheduleService.getExSchedule(exScNo);
		
		
		return exSchedule;
	}
	
//일단보류
	@RequestMapping(value="json/getDietSchedule/{dietScNo}", method = RequestMethod.GET)
	public DietSchedule getDietSchedule( @PathVariable("dietScNo") int dietScNo,  HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("json/getDietSchedule/{dietScNo} : GET");
		//Business Logic
		DietSchedule dietSchedule= dietScheduleService.getDietSchedule(dietScNo);
		
		
		return dietSchedule;
	}
	
	@RequestMapping(value="json/updateExSchedule/{exScNo}", method=RequestMethod.GET)
	public ExSchedule updateExSchedule( @PathVariable("exScNo") int exScNo ) throws Exception{

		System.out.println("/json/updateExSchedule/{exScNo} : GET");
		//Business Logic
		ExSchedule exSchedule = exScheduleService.getExSchedule(exScNo);
		// Model 과 View 연결
		
		
		return exSchedule;
	}
	
	@RequestMapping(value="json/updateExSchedule", method=RequestMethod.POST)
	public ExSchedule updateProduct( @RequestBody ExSchedule exSchedule ) throws Exception{

		System.out.println("/json/updateExSchedule : POST");
		//Business Logic
		ExSchedule exSchedule2 = new ExSchedule();
		if (exScheduleService.updateExSchedule(exSchedule)==1) {
			exSchedule2=exScheduleService.getExSchedule(exSchedule.getExScNo());	
		}
		
		return exSchedule2;
		
	
	}
	
	@RequestMapping(value="json/updateDietSchedule/{dietScNo}", method=RequestMethod.GET)
	public DietSchedule updateDietSchedule( @PathVariable("dietScNo") int dietScNo ) throws Exception{

		System.out.println("/json/updateDietSchedule/{dietScNo} : GET");
		//Business Logic
		DietSchedule dietSchedule = dietScheduleService.getDietSchedule(dietScNo);
		// Model 과 View 연결
		
		
		return dietSchedule;
	}
	
	@RequestMapping(value="json/updateDietSchedule", method=RequestMethod.POST)
	public DietSchedule updateDietSchedule( @RequestBody DietSchedule dietSchedule ) throws Exception{

		System.out.println("/json/updateDietSchedule : POST");
		//Business Logic
		DietSchedule dietSchedule2 = new DietSchedule();
		
			dietSchedule2=dietScheduleService.getDietSchedule(dietSchedule.getDietScNo());	
		
		return dietSchedule2;
	
	}
	
	@RequestMapping(value="json/deleteDietSchedule/{dietScNo}", method=RequestMethod.GET)
	public void deleteDietSchedule( @PathVariable("dietScNo") int dietScNo ) throws Exception{

		System.out.println("/json/deleteDietSchedule/{dietScNo} : GET");
		//Business Logic
		dietScheduleService.deleteDietSchedule(dietScNo);
		// Model 과 View 연결
		
		
	}
	
	@RequestMapping(value="json/deleteExSchedule/{exScNo}", method=RequestMethod.GET)
	public void deleteExSchedule( @PathVariable("exScNo") int exScNo ) throws Exception{

		System.out.println("/json/deleteExSchedule/{exScNo} : GET");
		//Business Logic
		exScheduleService.deleteExSchedule(exScNo);
		// Model 과 View 연결
		
		
	}
	
	
	
}