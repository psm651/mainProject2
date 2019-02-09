package com.wthealth.domain;


import java.util.List;

public class DietSchedule {

	private int dietScNo;
	private String userId;
	private List<Food> foodList;
	private String dietScDate;
	private double bmi;
	private int dietScCalorie;
	private String mealTime;
	private int weight;
	private String deleteStatus;
	

	public int getDietScNo() {
		return dietScNo;
	}


	public void setDietScNo(int dietScNo) {
		this.dietScNo = dietScNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Food> getFoodList() {
		return foodList;
	}


	public void setFoodList(List<Food> foodList) {
		this.foodList = foodList;
	}


	public String getDietScDate() {
		return dietScDate;
	}


	public void setDietScDate(String dietScDate) {
		this.dietScDate = dietScDate;
	}


	public double getBmi() {
		return bmi;
	}


	public void setBmi(double bmi) {
		this.bmi = bmi;
	}


	public int getDietScCalorie() {
		return dietScCalorie;
	}


	public void setDietScCalorie(int dietScCalorie) {
		this.dietScCalorie = dietScCalorie;
	}

	public String getMealTime() {
		return mealTime;
	}

	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "DietSchedule [dietScNo=" + dietScNo + ", userId=" + userId + ", foodList=" + foodList + ", dietScDate="
				+ dietScDate + ", bmi=" + bmi + ", dietScCalorie=" + dietScCalorie + ", mealTime=" + mealTime
				+ ", weight=" + weight + ", deleteStatus=" + deleteStatus + "]";
	}


	

	
	
}
