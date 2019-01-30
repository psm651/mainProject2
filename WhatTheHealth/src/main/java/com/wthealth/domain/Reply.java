package com.wthealth.domain;

import java.sql.Date;

public class Reply {
	
	///Field
	private int replyNo;
	private int parentReplyNo;
	private int reReplyNo;
	private Date replyDate;
	private String postNo;
	private String text;
	private String writerId;
	private String blindStatus;
	private String deleteStatus;
	private String postTitle;
	private String category;
	private String userImage;
	private String nickname;
	
	///Constructor
	public Reply() {
	}

	///Method
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public int getReReplyNo() {
		return reReplyNo;
	}

	public void setReReplyNo(int reReplyNo) {
		this.reReplyNo = reReplyNo;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
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

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", parentReplyNo=" + parentReplyNo + ", reReplyNo=" + reReplyNo
				+ ", replyDate=" + replyDate + ", postNo=" + postNo + ", text=" + text + ", writerId=" + writerId
				+ ", blindStatus=" + blindStatus + ", deleteStatus=" + deleteStatus + ", postTitle=" + postTitle
				+ ", category=" + category + ", userImage=" + userImage + ", nickname=" + nickname + "]";
	}

	


	
};

	