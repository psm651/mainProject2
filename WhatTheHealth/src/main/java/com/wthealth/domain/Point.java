package com.wthealth.domain;

import java.sql.Date;

public class Point {
	
	private int pointNo;
	private Date pointDate;
	private int usingPoint;
	private String pointStatus;
	private String senderId;
	private String receiverId;
	private int havingPoint;
	
	
	public Point() {
	}


	public int getPointNo() {
		return pointNo;
	}


	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}


	public Date getPointDate() {
		return pointDate;
	}


	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}


	public int getUsingPoint() {
		return usingPoint;
	}


	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}


	public String getPointStatus() {
		return pointStatus;
	}


	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}


	public String getSenderId() {
		return senderId;
	}


	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}


	public String getReceiverId() {
		return receiverId;
	}


	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}


	public int getHavingPoint() {
		return havingPoint;
	}


	public void setHavingPoint(int havingPoint) {
		this.havingPoint = havingPoint;
	}


	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", pointDate=" + pointDate + ", usingPoint=" + usingPoint
				+ ", pointStatus=" + pointStatus + ", senderId=" + senderId + ", receiverId=" + receiverId
				+ ", havingPoint=" + havingPoint + "]";
	}


	
	
	

}
