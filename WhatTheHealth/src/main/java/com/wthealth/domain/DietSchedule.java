package com.wthealth.domain;

import java.sql.Date;
import java.util.List;

public class DietSchedule {

	private int dietScNo;
	private String userId;
	private List<Food> food;
	private Date dietScDate;
	private double bmi;
	private int dietScCalorie;
	private String mealTime;
	private int weight;
	private String deleteStatus;
	/**
	 * 
	 */
	public DietSchedule() {
	}
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
	public List<Food> getFood() {
		return food;
	}
	public void setFood(List<Food> food) {
		this.food = food;
	}
	public Date getDietScDate() {
		return dietScDate;
	}
	public void setDietScDate(Date dietScDate) {
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
		return "DietSchedule [dietScNo=" + dietScNo + ", userId=" + userId + ", food=" + food + ", dietScDate="
				+ dietScDate + ", bmi=" + bmi + ", dietScCalorie=" + dietScCalorie + ", mealTime=" + mealTime
				+ ", weight=" + weight + "]";
	}
	
	
}
