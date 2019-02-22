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
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.exschedule.ExScheduleService;



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
	
	@Autowired
	@Qualifier("exInfoServiceImpl")	
	private ExInfoService exInfoService;

		
	public ScheduleController(){
		System.out.println(this.getClass());
	}
	

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
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
		System.out.println("/schedule/addExSchedule : POST123123123123");
		System.out.println("이건 운동넘버"+exSchedule.getPostNo());
		
		String photo =(exInfoService.getExInfo(exSchedule.getPostNo())).getPhoto();
		System.out.println("퐅토다"+photo);
		
	      String userId = ((User)session.getAttribute("user")).getUserId();
	      exSchedule.setUserId(userId);
	      exSchedule.setExScPhoto(photo);
	      System.out.println("add되는 exSchedule"+exSchedule);
		exScheduleService.addExSchedule(exSchedule);
		
		
	}

	
	
	@RequestMapping(value="getExSchedule", method = RequestMethod.GET)
	public String getExSchedule(Model model, @RequestParam("exScNo") int exScNo) throws Exception {
	
		System.out.println("/schedule/getExSchedule : GET");
		
		model.addAttribute("exSchedule", exScheduleService.getExSchedule(exScNo));
		
		return "forward:/schedule/getEx.jsp";
	}
	
	@RequestMapping(value="getDietSchedule", method = RequestMethod.GET)
	public String getDietSchedule(Model model, @RequestParam("dietScNo") int dietScNo) throws Exception {
	
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
		List<DietSchedule> dietList = dietScheduleService.getDietHistoryChart(userId);
		
		List exCalList = new ArrayList();
		List dietCalList = new ArrayList();
		List averageCalList = new ArrayList();
		
	
		
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		
		System.out.println("히스토리차트:::::"+(now.get(now.WEEK_OF_YEAR )+"").getClass());

		
	

		for (int j = 0; j < 53; j++) {
			int exCal=0;
			int dietCal=0;

			//exList
			for (int i = 0; i < exList.size(); i++) {
			

				now.setTime(sdf.parse(exList.get(i).getExScDate()));

				if (j ==now.get(now.WEEK_OF_YEAR )) {
					if (exList.get(i).getDeleteStatus().equals("0")) {
						exCal+=exList.get(i).getExScCalorie();
						
					}
				}
			}
			
			//dietList
			for (int i = 0; i < dietList.size(); i++) {

				now.setTime(sdf.parse(dietList.get(i).getDietScDate()));
				if (j ==now.get(now.WEEK_OF_YEAR )) {
					if (dietList.get(i).getDeleteStatus().equals("0")) {
						dietCal+=dietList.get(i).getDietScCalorie();
						System.out.println("히스토리차트 식단칼로리:::"+dietCal);
					}
				}
			}
			exCalList.add(j, exCal);
			
			
			dietCalList.add(j, dietCal);

			
			
			if (exCal>dietCal) {
				averageCalList.add(j,-(exCal-dietCal));
			}else {
				averageCalList.add(j,dietCal-exCal);
			}
			
			
		}

		
		
		

		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		
		
		System.out.println("123123123123"+map.get("exList"));
		System.out.println("456456465"+map.get("dietList"));

	
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		model.addAttribute("exCalorie", exCalList);
		model.addAttribute("dietCalorie", dietCalList);
		model.addAttribute("averageCalorie", averageCalList);
		
		
		System.out.println("dietCalList"+dietCalList);
		System.out.println("exCalList"+exCalList);
		System.out.println("averageCalList"+averageCalList);

		
	
		
		return "forward:/schedule/historyChart.jsp";
	}
	
	@RequestMapping(value="listSchedule")
	public String listSchedule(Model model, HttpSession session) throws Exception{
		System.out.println("/listSchedule : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		
		

	
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		

		
	
		
		return "forward:/schedule/listSchedule.jsp";
	}
}