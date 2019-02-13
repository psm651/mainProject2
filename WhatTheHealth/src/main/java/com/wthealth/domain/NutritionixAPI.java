package com.wthealth.domain;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.wthealth.common.URLConnection;

public class NutritionixAPI {

	//Field
	private final static String url = "https://trackapi.nutritionix.com/v2/natural/nutrients";
	private final static String propertyName = "x-app-id";
	private final static String propertyValue = "4dab41cd";
	private final static String propertyName2 = "x-app-key";
	private final static String propertyValu2 = "d5271826e137ee84e89875d1189d3264";
	private final static String contentType = "application/json";
	private String body = "";
	private JSONObject resultJSON = null; //api response json data
	private JSONObject foodJSON = null; //food 모든 정보를 담은 json data
	private JSONArray altMeasures = null; //1g, 1slice 등 1인분에 관한 JSON data
	private double calories = 0;
	private double serving_weight_grames = 0;
	
	
	//Constructor
	public NutritionixAPI() {
	}
	
	//papago로 부터 변역한 text api로 resquest
	public NutritionixAPI(String translatedText) throws Exception {
		
		JSONObject json = new JSONObject();
		json.put("query", translatedText);
		
		this.body = json.toString();
		
		this.resultJSON = URLConnection.getJSON_PARAMS
	    	(URLConnection.HTTPMETHOD_POST, url, body, contentType, propertyName, propertyValue, propertyName2, propertyValu2);
		
	}

	public JSONObject getResultJSON() {	
		return resultJSON;
	}
	
	public JSONArray getAltMeasures() {
		return this.altMeasures;
	}
	
	public void setJSONdata(JSONObject result) {
		this.foodJSON = (JSONObject) ((JSONArray)result.get("foods")).get(0);		
		this.altMeasures = (JSONArray)foodJSON.get("alt_measures");
	
	}
	
	public void setCalories(JSONArray altMeasures) {
		  double nf_calories = Double.parseDouble(foodJSON.get("nf_calories").toString());
		  System.out.println("nf_calories"+nf_calories);
          this.calories = Math.floor(nf_calories);
          System.out.println("calories : "+calories);
          this.serving_weight_grames = Double.parseDouble(foodJSON.get("serving_weight_grams").toString());
         
          System.out.println("serving_weight_grames : "+ serving_weight_grames);
	}

	public double getCalories() {
		return calories;
	}

	public double getServing_weight_grames() {
		return serving_weight_grames;
	}

	public JSONObject getFoodJSON() {
		return foodJSON;
	}



	
	
}
