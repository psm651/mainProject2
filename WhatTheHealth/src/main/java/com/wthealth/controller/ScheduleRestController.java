package com.wthealth.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exschedule.ExScheduleService;




//==> 회占쏙옙占쏙옙占쏙옙 Controller
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
	//setter Method 占쏙옙占쏙옙 占쏙옙占쏙옙
		
	public ScheduleRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 占쏙옙占쏙옙 占쌀곤옙
	//==> 占싣뤄옙占쏙옙 占싸곤옙占쏙옙 占쌍쇽옙占쏙옙 풀占쏙옙 占실미몌옙 확占쏙옙 占쌀곤옙
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	
	@RequestMapping(value="json/addDietSchedule", method = RequestMethod.POST)
	public DietSchedule addDietSchedule( @RequestBody DietSchedule dietSchedule, HttpSession session) throws Exception {

		System.out.println(dietSchedule.getFoodList());
		System.out.println(dietSchedule.getFoodList().size());
		
		
		dietSchedule.setUserId(((User)session.getAttribute("user")).getUserId());
		dietScheduleService.addDietSchedule(dietSchedule);
		
	    for (int i = 0; i < dietSchedule.getFoodList().size(); i++) {
	    	dietSchedule.getFoodList().get(i).setDietScNo(dietSchedule.getDietScNo());
	        dietScheduleService.addMeal(dietSchedule.getFoodList().get(i));
	     }
		DietSchedule dietSchedule1 = dietSchedule;
		
		dietSchedule1=dietScheduleService.getDietSchedule(dietSchedule.getDietScNo());
		
		return dietSchedule1;
		
	}
	
	
	@RequestMapping(value="json/addPostExSchedule", method = RequestMethod.POST)
	public void addPostExSchedule(@RequestBody ExSchedule exSchedule, HttpSession session) throws Exception {
		

		
		exSchedule.setUserId(((User)session.getAttribute("user")).getUserId());
		ExSchedule exSchedule1=exSchedule;
		
		
		exScheduleService.addPostExSchedule(exSchedule1);
	
	}
	
	
	
	@RequestMapping(value="json/addExSchedule", method = RequestMethod.POST)
	public ExSchedule addExSchedule( @RequestBody ExSchedule exSchedule, HttpSession session ) throws Exception {

		System.out.println("json/addExSchedule : POST");
		//Business Logic
		exSchedule.setUserId(((User)session.getAttribute("user")).getUserId());
		ExSchedule exSchedule1=exSchedule;
		
		System.out.println("디비가기전 exSchedule"+exSchedule);
		exScheduleService.addExSchedule(exSchedule);
		System.out.println("나오나요~~~~~~~"+exSchedule.getExScNo());
		
		//exScheduleService.getExSchedule(exScNo);
		exSchedule1=exScheduleService.getExSchedule(exSchedule.getExScNo());
		
		System.out.println("33333333333");

		return exSchedule1;
		
	}
	
	@RequestMapping(value="json/getExSchedule/{exScNo}", method = RequestMethod.GET)
	public ExSchedule getExSchedule( @PathVariable("exScNo") int exScNo,  HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("json/getExSchedule/{exScNo} : GET");
		System.out.println("�슫�룞�꽆踰�"+exScNo);
		//Business Logic
		ExSchedule exSchedule= exScheduleService.getExSchedule(exScNo);
		System.out.println("�슫�룞�뒪耳�以꾨쾲�샇�뿉"+exSchedule);
		
		
		return exSchedule;
	}
	
//占싹단븝옙占쏙옙
	@RequestMapping(value="json/getDietSchedule/{dietScNo}", method = RequestMethod.GET)
	public DietSchedule getDietSchedule( @PathVariable("dietScNo") int dietScNo,  HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("json/getDietSchedule/{dietScNo} : GET");
		//Business Logic
		DietSchedule dietSchedule= dietScheduleService.getDietSchedule(dietScNo);
		dietSchedule.setFoodList(dietScheduleService.listFood(dietScNo));
		System.out.println("이거슨 다엇스케쥴"+dietSchedule);
		
		
		return dietSchedule;
	}
	
	@RequestMapping(value="json/updateExSchedule/{exScNo}", method=RequestMethod.GET)
	public ExSchedule updateExSchedule( @PathVariable("exScNo") int exScNo ) throws Exception{

		System.out.println("/json/updateExSchedule/{exScNo} : GET");
		//Business Logic
		ExSchedule exSchedule = exScheduleService.getExSchedule(exScNo);
		// Model 占쏙옙 View 占쏙옙占쏙옙
		
		
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
		// Model 占쏙옙 View 占쏙옙占쏙옙
		
		
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
	public DietSchedule deleteDietSchedule( @PathVariable("dietScNo") int dietScNo ) throws Exception{

		System.out.println("/json/deleteDietSchedule/{dietScNo} : GET");
		//Business Logic
		dietScheduleService.deleteDietSchedule(dietScNo);
		
		DietSchedule dietSchedule = dietScheduleService.getDietSchedule(dietScNo);
		return dietSchedule;
	}
	
	@RequestMapping(value="json/deleteExSchedule/{exScNo}", method=RequestMethod.GET)
	public ExSchedule deleteExSchedule( @PathVariable("exScNo") int exScNo ) throws Exception{

		
		System.out.println("/json/deleteExSchedule/{exScNo} : GET");
		System.out.println(exScNo);
		//Business Logic
		exScheduleService.deleteExSchedule(exScNo);
		// Model 占쏙옙 View 占쏙옙占쏙옙
		ExSchedule exSchedule = exScheduleService.getExSchedule(exScNo);
		
		
		return exSchedule;
		
	}
	
	
	
	
	
}