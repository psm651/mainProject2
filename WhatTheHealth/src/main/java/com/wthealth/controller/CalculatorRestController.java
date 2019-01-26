package com.wthealth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.BMI;
import com.wthealth.domain.Food;

@RestController
@RequestMapping("/calculator/*")
public class CalculatorRestController {
	
	//Field	
	public CalculatorRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/getCalculationBMI", method=RequestMethod.POST)
	public BMI getCalculationBMI(@RequestBody BMI bmi) throws Exception{
		System.out.println(bmi);
		BMI calBmi = new BMI(bmi.getHeight(), bmi.getWeight());
		
		return calBmi;
	}
	
 
	@RequestMapping(value = "json/getSearchFood/{searchFood}", method=RequestMethod.GET)
	public List<Food> getSearchFood(@PathVariable String searchFood) throws Exception{
		

		List<Food> foodInfo = new ArrayList<Food>();
        
		System.setProperty("webdriver.chrome.driver", "C:\\chromedriver.exe");
		
        WebDriver driver = new ChromeDriver();
      
        // And now use this to visit Google
        driver.get("https://www.myfitnesspal.com/ko/food/calorie-chart-nutrition-facts");

        // Find the text input element by its name
        WebElement element = driver.findElement(By.name("search"));
   
        // Enter something to search for
        element.sendKeys(searchFood);
        // Now submit the form. WebDriver will find the form for us from the element
        element.submit();
     
        List<WebElement> getFood = driver.findElements(By.cssSelector(".food_search_results > li"));

  
        for(WebElement foods:getFood) {
           Food food = new Food();

           String[] tempName = foods.getText().split("\n");
           food.setFoodName(tempName[0].replaceAll(" ", ""));
        
           String[] tempAmountfood = tempName[1].substring(6).split(",");
           food.setAmountFood(tempAmountfood[0].replaceAll(" ", ""));
           
           String tempCalorie = tempAmountfood[1].substring(7);

           if(tempCalorie.contains(".")) {
 
        	   String[] temp = tempCalorie.split("\\.");;     
        	   food.setFoodCalorie(Integer.parseInt(temp[0])); 
           }else {
        	 
        	   food.setFoodCalorie(Integer.parseInt(tempCalorie.replaceAll(" ", "")));
           
           }
           System.out.println(food);
           foodInfo.add(food);
         
           }
        
       
        // Should see: "cheese! - Google Search"
        System.out.println("Page title is: " + driver.getTitle());
        
        //Close the browser
        driver.quit();
       
		return foodInfo; 
	}

	
	
}
