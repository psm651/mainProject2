package com.wthealth.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/calculator/*")
public class CalculatorController {

	/// Field
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;

	// setter Method 구현 않음

	public CalculatorController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것

    //칼로리계산기 스케줄 저장
    @RequestMapping(value="addDietSchedule", method=RequestMethod.POST)
    public void addDietSchedule( @ModelAttribute("food") Food food, @RequestParam String dietScDate, String mealTime, String amount, HttpSession session)throws Exception{
    
       User user = new User();
       DietSchedule dietSchedule = new DietSchedule();
       
       String userId = ((User)session.getAttribute("user")).getUserId();
       System.out.println("foodInfos"+food.getFoodInfos());
       
       dietSchedule.setUserId(userId);
       dietSchedule.setDietScDate(dietScDate);
       dietSchedule.setFood(food.getFoodInfos());
       dietSchedule.setMealTime(mealTime);
       dietSchedule.setDietScCalorie(Integer.parseInt(amount));
     
       
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
}