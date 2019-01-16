package com.wthealth.domain;

public class BMI {

	//Field
	private Double height;
	private Double weight;
	private Double bmiValue;
	private String bmiState;
	
	//Constructor
	public BMI() {
		
	}
	
	public BMI(Double height, Double bmiWeight){
		
		height = height/100;

		this.bmiValue = bmiWeight/(height*height);
				
		this.bmiValue = Math.round(bmiValue*100)/100.0;
		
		
		
		if(bmiValue<18.5){
			this.bmiState = "��ü��"; 
		}else if(18.5<bmiValue && bmiValue<25) {
			this.bmiState = "����";
		}else if(25<bmiValue && bmiValue<30) {
			this.bmiState = "��ü��";
		}else if(30<bmiValue) {
			this.bmiState = "��";
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

/*	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}*/

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

	@Override
	public String toString() {
		return "BMI [height=" + height + ", weight=" + weight + ", bmiValue=" + bmiValue + ", bmiState=" + bmiState
				+ "]";
	}
	
}
