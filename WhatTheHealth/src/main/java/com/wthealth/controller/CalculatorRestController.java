package com.wthealth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	
	
	
	//search Food 
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

        ///////////////////////////////////////////////////////////////////////////
      
     
        List<WebElement> getFood = driver.findElements(By.cssSelector(".food_search_results > li"));
        

        Food food = new Food();
        
        System.out.println("?””ë²„ê¹…");
  
        for(WebElement foods:getFood) {
        	
           System.out.println("for ë¬? ?•ˆ");
           String[] tempName = foods.getText().split("\n");
           food.setFoodName(tempName[0].replaceAll(" ", ""));
           System.out.println(food.getFoodName());
          
           String[] tempAmountfood = tempName[1].substring(6).split(",");
           /*food.setAmountFood(Integer.parseInt(tempAmountfood.replaceAll(" ", "")));
           System.out.println(food.getAmountFood());
           
           String tempCalorie = tempCalorie[1].substring(7);
           food.setFoodCalorie(Integer.parseInt(tempCalorie[0].replaceAll(" ", "")));   
           System.out.println(food.getFoodCalorie());*/
           

                
           foodInfo.add(food);
        }
        
        // Should see: "cheese! - Google Search"
        System.out.println("Page title is: " + driver.getTitle());
        
        //Close the browser
        driver.quit();
	
		return foodInfo; 
	}

	
	
}
