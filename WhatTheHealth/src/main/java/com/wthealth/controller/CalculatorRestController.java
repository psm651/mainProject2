package com.wthealth.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.BMI;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
import com.wthealth.domain.NutritionixAPI;
import com.wthealth.domain.PapaGo;
import com.wthealth.domain.User;

import com.wthealth.service.claim.ClaimService;
import com.wthealth.service.dietschedule.DietScheduleService;

@RestController
@RequestMapping("/calculator/*")
public class CalculatorRestController {
	
	//Field	
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;
	
	public CalculatorRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/updateScheduleBMI", method=RequestMethod.POST)
	public String updateScheduleBMI(@RequestBody BMI bmi, HttpSession session) throws Exception{
		
		System.out.println(bmi);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
	
		bmi.setUserId(userId);
		dietScheduleService.addBmi(bmi);
	
		String successMessage = "스케줄에 저장이 완료되었습니다.";
		return successMessage;
	}
	
	
	@RequestMapping(value="json/getCalculationBMI", method=RequestMethod.POST)
	public BMI getCalculationBMI(@RequestBody BMI bmi) throws Exception{
		
		BMI calBmi = new BMI(bmi.getHeight(), bmi.getWeight());
		
		return calBmi;
	}
	
	@RequestMapping(value = "json/getSearchFood/{searchFood}", method=RequestMethod.GET)
	public List<Food> getSearchFood(@PathVariable String searchFood) throws Exception{

		List<Food> foodInfo = new ArrayList<Food>();

		//PapagoAPI Ko->En 변환 
		String param = "source=ko&target=en&text=" + URLEncoder.encode(searchFood,"UTF-8");
		PapaGo translate = new PapaGo(param);
				
        NutritionixAPI nutrition = new NutritionixAPI(translate.getResultTranslate());
   
        JSONObject result = nutrition.getResultJSON();
        //api로부터 받은 JSON 데이터 가공 
        nutrition.setJSONdata(result);     
        JSONArray altMeasures = nutrition.getAltMeasures();
        
        //JSON 데이터로부터 칼로리계산에 필요한 값을 셋팅
        nutrition.setCalories(altMeasures);
        
        double weightGrames = nutrition.getServing_weight_grames();
        
        for(int i=0;i<altMeasures.size();i++){
        	Food food = new Food();
        	
        	String amountFood = (String)((JSONObject)altMeasures.get(i)).get("measure");
        	String foodName = (String)nutrition.getFoodJSON().get("food_name"); 
        	
        	double serving_weight = Double.parseDouble(((JSONObject)altMeasures.get(i)).get("serving_weight").toString());
        	String calorie =Double.toString(Math.floor((serving_weight/weightGrames)*nutrition.getCalories()));
       
	        food.setAmountFood(amountFood);
	        food.setFoodName(foodName);
	        food.setFoodCalorie(calorie);
	        
	        foodInfo.add(food);
	        System.out.println(foodInfo.get(i));
        }
        
		return foodInfo;
	}


	@RequestMapping(value="json/addDietSchedule", method=RequestMethod.POST)
	public void addDietSchedule(@RequestBody DietSchedule dietSchedule) throws Exception{
		
		System.out.println();
	}
	
	
}
