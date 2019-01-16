package com.wthealth.domain;

public class LocationTag {

	//Field
	private int locationTagNo;
	private String locationTagName;
	private int postNo;
	private Double xCoordinate;
	private Double yCoordinate;
	
	//Constructor
	public LocationTag() {
	}

	//Method
	public int getLocationTagNo() {
		return locationTagNo;
	}

	public void setLocationTagNo(int locationTagNo) {
		this.locationTagNo = locationTagNo;
	}

	public String getLocationTagName() {
		return locationTagName;
	}

	public void setLocationTagName(String locationTagName) {
		this.locationTagName = locationTagName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public Double getxCoordinate() {
		return xCoordinate;
	}

	public void setxCoordinate(Double xCoordinate) {
		this.xCoordinate = xCoordinate;
	}

	public Double getyCoordinate() {
		return yCoordinate;
	}

	public void setyCoordinate(Double yCoordinate) {
		this.yCoordinate = yCoordinate;
	}

	@Override
	public String toString() {
		return "LocationTag [locationTagNo=" + locationTagNo + ", locationTagName=" + locationTagName + ", postNo="
				+ postNo + ", xCoordinate=" + xCoordinate + ", yCoordinate=" + yCoordinate + "]";
	}
	
	
	

}
