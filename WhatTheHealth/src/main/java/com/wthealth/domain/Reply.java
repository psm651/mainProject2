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

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", parentReplyNo=" + parentReplyNo + ", reReplyNo=" + reReplyNo
				+ ", replyDate=" + replyDate + ", postNo=" + postNo + ", text=" + text + ", writerId=" + writerId
				+ ", blindStatus=" + blindStatus + ", deleteStatus=" + deleteStatus + "]";
	};
	
};

	