package com.wthealth.domain;

public class Weather {

	//Field
	private String cityName;
	private double temperature;
	private String currentWeather;
	private String cityID;

	//Constructor
	public Weather() {
	}

	public String getCityID() {
		return cityID;
	}	

	public void setCityID(String cityID) {
		this.cityID = cityID;
	}	
	
	public String getCityName() {
		return cityName;
	}


	public void setCityName(String cityName) {
		this.cityName = cityName;
	}


	public double getTemperature() {
		return temperature;
	}


	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}


	public String getCurrentWeather() {
		return currentWeather;
	}


	public void setCurrentWeather(String currentWeather) {
		this.currentWeather = currentWeather;
	}

	@Override
	public String toString() {
		return "Weather [cityName=" + cityName + ", temperature=" + temperature + ", currentWeather=" + currentWeather
				+ ", cityID=" + cityID + "]";
	}


	
	
}
