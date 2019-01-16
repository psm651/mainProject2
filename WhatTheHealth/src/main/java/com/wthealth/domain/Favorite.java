package com.wthealth.domain;

import java.sql.Date;

public class Favorite {
	
	private int favoriteNo;
	private String userId;
	private String postNo;
	private String favoriteType;
	private String category;
	private String contents;
	private String title;
	private Date postDate;
	private String userImage;
	private String nickName;
	private int likeCount;
	
	public Favorite() {
	}

	public int getFavoriteNo() {
		return favoriteNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getFavoriteType() {
		return favoriteType;
	}

	public void setFavoriteType(String favoriteType) {
		this.favoriteType = favoriteType;
	}

	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Favorite [favoriteNo=" + favoriteNo + ", userId=" + userId + ", postNo=" + postNo + ", favoriteType="
				+ favoriteType + ", category=" + category + ", contents=" + contents + ", title=" + title
				+ ", postDate=" + postDate + ", userImage=" + userImage + ", nickName=" + nickName + ", likeCount="
				+ likeCount + "]";
	}

}
