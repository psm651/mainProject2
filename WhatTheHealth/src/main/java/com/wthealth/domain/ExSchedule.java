package com.wthealth.domain;

import java.sql.Date;

public class ExSchedule {
	
	private int exScNo;
	private String userId;
	private String exScName;
	private int exScCalorie;
	private String exScTime;
	private String exScContents;
	private Date exScDate;
	private String postNo;
	private String deleteStatus;
	
	public ExSchedule() {
	}

	public int getExScNo() {
		return exScNo;
	}

	public void setExScNo(int exScNo) {
		this.exScNo = exScNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getExScName() {
		return exScName;
	}

	public void setExScName(String exScName) {
		this.exScName = exScName;
	}

	public int getExScCalorie() {
		return exScCalorie;
	}

	public void setExScCalorie(int exScCalorie) {
		this.exScCalorie = exScCalorie;
	}

	public String getExScTime() {
		return exScTime;
	}

	public void setExScTime(String exScTime) {
		this.exScTime = exScTime;
	}

	public String getExScContents() {
		return exScContents;
	}

	public void setExScContents(String exScContents) {
		this.exScContents = exScContents;
	}

	public Date getExScDate() {
		return exScDate;
	}

	public void setExScDate(Date exScDate) {
		this.exScDate = exScDate;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "ExSchedule [exScNo=" + exScNo + ", userId=" + userId + ", exScName=" + exScName + ", exScCalorie="
				+ exScCalorie + ", exScTime=" + exScTime + ", exScContents=" + exScContents + ", exScDate=" + exScDate
				+ ", postNo=" + postNo + ", deleteStatus=" + deleteStatus + "]";
	}

	
}
