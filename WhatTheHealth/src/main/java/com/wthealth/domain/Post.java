package com.wthealth.domain;

import java.sql.Date;

public class Post {
	
	private String postNo;
	private String userId;
	private String title;
	private String contents;
	private String nickName;
	private String photo;
	private String video;
	private int clickCount;
	private String blindStatus;
	private String deleteStatus;
	private int likeCount;
	private String category;
	private Date postDate;
	///////////////////커뮤니티////////////////////
	private int exScNo;
	private int dietScNo;
	//////////////////운동정보게시물////////////////
	private int exInfoNo;
	private int exCalorie;
	private String exPlace;
	private String exPart;
	private String exVideoTime;
	//////////////////위치태그///////////////////
	private String locationTagName;
	private double xCoordinate;
	private double yCoordinate;
	private String address;
	
	public Post() {
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public String getBlindStatus() {
		return blindStatus;
	}

	public void setBlindStatus(String blindStatus) {
		this.blindStatus = blindStatus;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getExScNo() {
		return exScNo;
	}

	public void setExScNo(int exScNo) {
		this.exScNo = exScNo;
	}

	public int getDietScNo() {
		return dietScNo;
	}

	public void setDietScNo(int dietScNo) {
		this.dietScNo = dietScNo;
	}

	public int getExInfoNo() {
		return exInfoNo;
	}

	public void setExInfoNo(int exInfoNo) {
		this.exInfoNo = exInfoNo;
	}

	public int getExCalorie() {
		return exCalorie;
	}

	public void setExCalorie(int exCalorie) {
		this.exCalorie = exCalorie;
	}

	public String getExPlace() {
		return exPlace;
	}

	public void setExPlace(String exPlace) {
		this.exPlace = exPlace;
	}

	public String getExPart() {
		return exPart;
	}

	public void setExPart(String exPart) {
		this.exPart = exPart;
	}

	public String getExVideoTime() {
		return exVideoTime;
	}

	public void setExVideoTime(String exVideoTime) {
		this.exVideoTime = exVideoTime;
	}

	public String getLocationTagName() {
		return locationTagName;
	}

	public void setLocationTagName(String locationTagName) {
		this.locationTagName = locationTagName;
	}

	public double getxCoordinate() {
		return xCoordinate;
	}

	public void setxCoordinate(double xCoordinate) {
		this.xCoordinate = xCoordinate;
	}

	public double getyCoordinate() {
		return yCoordinate;
	}

	public void setyCoordinate(double yCoordinate) {
		this.yCoordinate = yCoordinate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", userId=" + userId + ", title=" + title + ", contents=" + contents
				+ ", nickName=" + nickName + ", photo=" + photo + ", video=" + video + ", clickCount=" + clickCount
				+ ", blindStatus=" + blindStatus + ", deleteStatus=" + deleteStatus + ", likeCount=" + likeCount
				+ ", category=" + category + ", postDate=" + postDate + ", exScNo=" + exScNo + ", dietScNo=" + dietScNo
				+ ", exInfoNo=" + exInfoNo + ", exCalorie=" + exCalorie + ", exPlace=" + exPlace + ", exPart=" + exPart
				+ ", exVideoTime=" + exVideoTime + ", locationTagName=" + locationTagName + ", xCoordinate="
				+ xCoordinate + ", yCoordinate=" + yCoordinate + ", address=" + address + "]";
	}

}
