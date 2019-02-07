package com.wthealth.domain;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.wthealth.common.URLConnection;

public class NutritionixAPI {

	//Field
	private final static String url = "https://trackapi.nutritionix.com/v2/natural/nutrients";
	private final static String propertyName = "x-app-id";
	private final static String propertyValue = "0312b34b";
	private final static String propertyName2 = "x-app-key";
	private final static String propertyValu2 = "5fed24fc394420ed4b5e91ba37954e31";
	private final static String contentType = "application/json";
	private String body = "";
	private JSONObject resultJSON = null; //api response json data
	private JSONObject foodJSON = null; //food 모든 정보를 담은 json data
	private JSONArray altMeasures = null; //1g, 1slice 등 1인분에 관한 JSON data
	private double calories = 0;
	private long serving_weight_grames = 0;
	
	
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
          this.calories = Math.floor(nf_calories);
          this.serving_weight_grames = Long.parseLong(foodJSON.get("serving_weight_grams").toString());
	}

	public double getCalories() {
		return calories;
	}

	public long getServing_weight_grames() {
		return serving_weight_grames;
	}

	public JSONObject getFoodJSON() {
		return foodJSON;
	}



	
	
}
