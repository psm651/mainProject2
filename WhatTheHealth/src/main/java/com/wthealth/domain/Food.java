package com.wthealth.domain;

import java.util.ArrayList;
import java.util.List;

public class Food {

	private String foodName;
	private String foodCalorie;
	private String amountFood;
	private int dietScNo;
//	private String dietScCalorie;
	private List<Food> foodInfos;

	public Food() {
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodCalorie() {
		return foodCalorie;
	}

	public void setFoodCalorie(String foodCalorie) {
		this.foodCalorie = foodCalorie;
	}

	public String getAmountFood() {
		return amountFood;
	}

	public void setAmountFood(String amountFood) {
		this.amountFood = amountFood;
	}

	public int getDietScNo() {
		return dietScNo;
	}

	public void setDietScNo(int dietScNo) {
		this.dietScNo = dietScNo;
	}

	@Override
	public String toString() {
		return "Food [foodName=" + foodName + ", foodCalorie=" + foodCalorie + ", amountFood=" + amountFood
				+ ", dietScNo=" + dietScNo + "]";
	}

	public List<Food> getFoodInfos() {
		return foodInfos;
	}

	public void setFoodInfos(List<Food> foodInfos) {
		this.foodInfos = foodInfos;
	}


/*	public String getDietScCalorie() {
		return dietScCalorie;
	}

	public void setDietScCalorie(String dietScCalorie) {
		this.dietScCalorie = dietScCalorie;
	}*/



	








	
	
	
}
