package com.wthealth.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
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

import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.ExSchedule;
import com.wthealth.domain.Food;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exschedule.ExScheduleService;


//==> 회占쏙옙占쏙옙占쏙옙 Controller
@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	///Field
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;
	
	@Autowired
	@Qualifier("exScheduleServiceImpl")	
	private ExScheduleService exScheduleService;
	//setter Method 占쏙옙占쏙옙 占쏙옙占쏙옙
		
	public ScheduleController(){
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
	

	@RequestMapping(value="addExSchedule", method = RequestMethod.GET)
	public String addExSchedule(Model model, @RequestParam("date") String date) throws Exception {

		System.out.println("/schedule/addExSchedule : GET");
		model.addAttribute("ExScDate", date);
		
		return "forward:/schedule/addEx.jsp";
	}
	
	@RequestMapping(value="addExSchedule", method = RequestMethod.POST)
	public void addExSchedule(@ModelAttribute ExSchedule exSchedule, Model model,HttpSession session) throws Exception {
		System.out.println(exSchedule);
		
		System.out.println("/schedule/addExSchedule : POST");
	      String userId = ((User)session.getAttribute("user")).getUserId();
	      exSchedule.setUserId(userId);
		exScheduleService.addExSchedule(exSchedule);
		
		//return "forward:/schedule/addEx.jsp";
	}
	
	   //칼로리계산기 스케줄 저장
	   @RequestMapping(value="addDietSchedule", method=RequestMethod.POST)
	   public void addDietSchedule( @ModelAttribute("food") Food food, @RequestParam String dietScDate, String mealTime, HttpSession session)throws Exception{
	   
	      User user = new User();
	      DietSchedule dietSchedule = new DietSchedule();
	      
	      String userId = ((User)session.getAttribute("user")).getUserId();
	      System.out.println("foodInfos"+food.getFoodInfos());
	      
	      dietSchedule.setUserId(userId);
	      dietSchedule.setDietScDate(dietScDate);
	      dietSchedule.setFood(food.getFoodInfos());
	      dietSchedule.setMealTime(mealTime);
	      
	    
	      
	      System.out.println("dietSchedule!#!@#"+dietSchedule);
	      
	      dietScheduleService.addDietSchedule(dietSchedule);
	      System.out.println("dietScNo받아오나"+dietSchedule.getDietScNo());
	      //다이어트 scno넣어야함
	      for (int i = 0; i < food.getFoodInfos().size(); i++) {
	    	  System.out.println(food.getFoodInfos().get(i));
	    	  food.getFoodInfos().get(i).setDietScNo(dietSchedule.getDietScNo());
	    	  dietScheduleService.addMeal(food.getFoodInfos().get(i));
		}
	   }
	
	
	@RequestMapping(value="getExSchedule", method = RequestMethod.GET)
	public String getExSchedule(Model model, @RequestParam("exScNo") int exScNo) throws Exception {
		System.out.println("�슫�룞�꽆踰�123123"+exScNo);
		System.out.println("/schedule/getExSchedule : GET");
		
		model.addAttribute("exSchedule", exScheduleService.getExSchedule(exScNo));
		
		return "forward:/schedule/getEx.jsp";
	}
	
	@RequestMapping(value="getDietSchedule", method = RequestMethod.GET)
	public String getDietSchedule(Model model, @RequestParam("dietScNo") int dietScNo) throws Exception {
		System.out.println("�떇�떒�꽆踰꾨떎"+dietScNo);
		System.out.println("/schedule/getDietSchedule : GET");
		//dietScheduleService.list
		model.addAttribute("food", dietScheduleService.listFood(dietScNo));
		
		System.out.println(dietScheduleService.listFood(dietScNo).get(2));
		model.addAttribute("dietSchedule", dietScheduleService.getDietSchedule(dietScNo));
		
		return "forward:/schedule/getDiet.jsp";
	}

	@RequestMapping(value="getHistoryChart")
	public String getHistoryChart(/*@RequestParam("userId") String userId,*/ Model model, HttpSession session) throws Exception{
		System.out.println("/getHistoryChart : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		
		List<ExSchedule> exList = exScheduleService.getExHistoryChart(userId);
		
		List calList = new ArrayList();
		//int cal=0;
		
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		now.setTime(sdf.parse("2019-01-29"));
		/*System.out.println("�뀈"+now.get(1));
		System.out.println("�썡"+now.get(2));
		System.out.println("�씪"+now.get(5));
		*/
		
		System.out.println("�쁽�옱紐뉗＜李⑥씤吏� �뜲�씠�꽣���엯"+(now.get(now.WEEK_OF_YEAR )+"").getClass());
		System.out.println("db�뿉�꽌 諛쏆븘�삩 �궇吏� �뜲�씠�꽣���엯"+(exList.get(2).getExScDate()).getClass());
		System.out.println((now.get(now.WEEK_OF_YEAR ))+"");
		
	
		for (int j = 0; j < 53; j++) {
			int cal=0;
			for (int i = 0; i < exList.size(); i++) {
				now.setTime(sdf.parse(exList.get(i).getExScDate()));
				if (j ==now.get(now.WEEK_OF_YEAR )) {
					if (!exList.get(i).getDeleteStatus().equals("1")) {
						cal+=exList.get(i).getExScCalorie();
					}
				}
			}
			calList.add(j, cal);
			System.out.println(j+"二쇱감"+calList.get(j));
		}
		
		
		
		
		//List<DietSchedule> dietList = dietScheduleService.getExHistoryChart(userId);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		
		
		System.out.println("123123123123"+map.get("exList"));

		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		model.addAttribute("exCalorie", calList);
		System.out.println("留듭씠�떎"+calList);

		
	
		
		return "forward:/schedule/historyChart.jsp";
	}
	
	@RequestMapping(value="listSchedule")
	public String listProduct(/*@RequestParam("userId") String userId,*/ Model model, HttpSession session) throws Exception{
		System.out.println("/listSchedule : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		//map.compute("mealList", dietScheduleService.list)
		
		

		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		
		System.out.println("留듭씠�떎"+map.get("exList"));
		System.out.println("�떎�씠�뼱�듃由ъ뒪�뀫�뀒"+map.get("dietList"));
		
	
		
		return "forward:/schedule/listSchedule.jsp";
	}
}