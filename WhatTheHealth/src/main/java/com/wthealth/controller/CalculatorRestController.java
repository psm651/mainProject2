package com.wthealth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
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
import com.wthealth.domain.BMI;
import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.Food;
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
	public void updateScheduleBMI(@RequestBody BMI bmi) throws Exception{
		
		dietScheduleService.addBmi(bmi);		
	}
	
	
	@RequestMapping(value="json/getCalculationBMI", method=RequestMethod.POST)
	public BMI getCalculationBMI(@RequestBody BMI bmi) throws Exception{
		
		BMI calBmi = new BMI(bmi.getHeight(), bmi.getWeight());
		
		return calBmi;
	}
	
 
	@RequestMapping(value = "json/getSearchFood/{searchFood}", method=RequestMethod.GET)
	public List<Food> getSearchFood(@PathVariable String searchFood) throws Exception{
		

		List<Food> foodInfo = new ArrayList<Food>();
        
		System.setProperty("webdriver.chrome.driver", "C:\\chromedriver.exe");
		
		//Cross 브라우저 해결을 위한 옵션 적용 
		//Bot 크롤링 방지를 위한 user-Agent 설정
        DesiredCapabilities capabilities =DesiredCapabilities.chrome();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("test-type");
        options.addArguments("-disable-web-security");
        options.addArguments("-allow-running-insecure-content");
        options.addArguments("--user-agent=Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");
        capabilities.setCapability(ChromeOptions.CAPABILITY, options);		
        
        //chrome 드라이버 설정 
        WebDriver driver = new ChromeDriver(capabilities);
      
        //크롤링 할 웹페이지 접근 
        driver.get("https://www.myfitnesspal.com/ko/food/search");

        // Find the text input element by its name
        WebElement element = driver.findElement(By.cssSelector("form > input"));
        
        // Enter something to search for
        element.sendKeys(searchFood);
        // Now submit the form. WebDriver will find the form for us from the element
        element.submit();
     
   //     WebE foodss = driver.findElement(By.cssSelector(".section2-2i8B2 "));
       
        //WebElement foodss = driver.findElement(By.className("jss44"));
  //      System.out.println(foodss.getTagName());
   //     System.out.println(foodss.getText());
        
        WebElement foodss = driver.findElement(By.className("jss45"));	
       System.out.println( foodss.getText());     
       System.out.println(foodss.getTagName());
       System.out.println(foodss.getSize());
       /* for(WebElement foods:foodss) {
        
        	
        }*/
/*
        for(WebElement foods:foodName) {
           Food food = new Food();

           	String foodNames = foods.getText();
           	System.out.println(foodNames);
           String[] tempName = foods.getText().split("\n");
           System.out.println(foods.getText());
           food.setFoodName(tempName[0].replaceAll(" ", ""));
        
           String[] tempAmountfood = tempName[1].substring(6).split(",");
           food.setAmountFood(tempAmountfood[0].replaceAll(" ", ""));
           
           String tempCalorie = tempAmountfood[1].substring(7);

           if(tempCalorie.contains(".")) {
 
        	   String[] temp = tempCalorie.split("\\.");;     
        	   food.setFoodCalorie(temp[0]); 
           }else {
        	 
        	   food.setFoodCalorie(tempCalorie.replaceAll(" ", ""));
           
           }
           System.out.println(food);
           foodInfo.add(food);
         
           }*/
        
       
        // Should see: "cheese! - Google Search"
        System.out.println("Page title is: " + driver.getTitle());
        
        //Close the browser
        driver.quit();
       
		return foodInfo; 
	}

	@RequestMapping(value="json/addDietSchedule", method=RequestMethod.POST)
	public void addDietSchedule(@RequestBody DietSchedule dietSchedule) throws Exception{
		
		System.out.println();
	}
	
	
}
