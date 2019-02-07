package com.wthealth.domain;

public class BMI {

	//Field
	private Double height;
	private Double weight;
	private Double bmiValue;
	private String bmiState;
	private String dietScDateBMI;
	private String userId;
	
	//Constructor
	public BMI() {
		
	}
	
	public BMI(Double height, Double bmiWeight){
		
		height = height/100;

		this.bmiValue = bmiWeight/(height*height);
				
		this.bmiValue = Math.round(bmiValue*100)/100.0;
		
		
		
		if(bmiValue<18.5){
			this.bmiState = "저체중"; 
		}else if(18.5<bmiValue && bmiValue<25) {
			this.bmiState = "정상";
		}else if(25<bmiValue && bmiValue<30) {
			this.bmiState = "비만";
		}else if(30<bmiValue) {
			this.bmiState = "고도비만";
		}
		
	}
	
	//Method

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getDietScDateBMI() {
		return dietScDateBMI;
	}

	public void setDietScDateBMI(String dietScDateBMI) {
		this.dietScDateBMI = dietScDateBMI;
	}

	public Double getBmiValue() {
		return bmiValue;
	}

	public void setBmiValue(Double bmiValue) {
		this.bmiValue = bmiValue;
	}

	public String getBmiState() {
		return bmiState;
	}

	public void setBmiState(String bmiState) {
		this.bmiState = bmiState;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BMI [height=" + height + ", weight=" + weight + ", bmiValue=" + bmiValue + ", bmiState=" + bmiState
				+ ", dietScDateBMI=" + dietScDateBMI + ", userId=" + userId + "]";
	}



	
}
