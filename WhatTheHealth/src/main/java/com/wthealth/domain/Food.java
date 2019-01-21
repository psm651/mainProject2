package com.wthealth.domain;

public class Food {

	private String foodName;
	private int foodCalorie;
	private String amountFood;
	private int dietScNo;

	public Food() {
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodCalorie() {
		return foodCalorie;
	}

	public void setFoodCalorie(int foodCalorie) {
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
	
	
	
}
