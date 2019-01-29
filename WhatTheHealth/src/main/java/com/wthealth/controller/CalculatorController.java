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

//==> ȸ������ Controller
@Controller
@RequestMapping("/calculator/*")
public class CalculatorController {

	/// Field
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;

	// setter Method ���� ����

	public CalculatorController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// ���� �Ұ�
	// ==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�

    //Į�θ����� ������ ����
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
       System.out.println("dietScNo�޾ƿ���"+dietSchedule.getDietScNo());
       //���̾�Ʈ scno�־����
       for (int i = 0; i < food.getFoodInfos().size(); i++) {
          System.out.println(food.getFoodInfos().get(i));
          food.getFoodInfos().get(i).setDietScNo(dietSchedule.getDietScNo());
          dietScheduleService.addMeal(food.getFoodInfos().get(i));
       }
   
 	
    }
}