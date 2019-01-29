package com.wthealth.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.main.MainService;

@Controller
@RequestMapping("/calculator/*")
public class CalculatorController {

	//Field
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;

	//Constructor
	public CalculatorController() {
		System.out.println(this.getClass());
	}
	
	//칼로리계산기 스케줄 저장
	@RequestMapping(value="addDietSchedule", method=RequestMethod.POST)
	public void addDietSchedule( @ModelAttribute("food") Food food, @RequestParam String dietScDate, String mealTime, HttpSession session)throws Exception{
	
		User user = new User();
		DietSchedule dietSchedule = new DietSchedule();
		
		String userId = ((User)session.getAttribute("user")).getUserId();

		dietSchedule.setUserId(userId);
		dietSchedule.setDietScDate(dietScDate);
		dietSchedule.setFood(food.getFoodInfos());
		
		dietSchedule.setMealTime(mealTime);

		
		System.out.println(dietSchedule);
		
		dietScheduleService.addDietSchedule(dietSchedule);
	}
	
	//bmi계산기 스케줄 저장 
/*	@RequestMapping(value="addCalorie", method=RequestMethod.POST)
	public void addCalorie(@ModelAttribute Food food) {
		
		
	}*/
}