package com.wthealth.domain;

import java.sql.Date;

public class Meeting {
	
	///Field
	private int meetNo;
	private Post post;			//게시판VO 포함
	private int depoAmount;
	private String depoBank;
	private String depoAccount;
	private Date depoDeadline;
	private String depoAccHolder;
	private int entryfee;
	private int minParty;
	private int maxParty;
	private String cheifId;
	private String depoCondition;
	private Date meetTime;
	private Date deadlineTime;
	
	///Constructor
	public Meeting() {
	}
	
	///Method
	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getDepoAmount() {
		return depoAmount;
	}

	public void setDepoAmount(int depoAmount) {
		this.depoAmount = depoAmount;
	}

	public String getDepoBank() {
		return depoBank;
	}

	public void setDepoBank(String depoBank) {
		this.depoBank = depoBank;
	}

	public String getDepoAccount() {
		return depoAccount;
	}

	public void setDepoAccount(String depoAccount) {
		this.depoAccount = depoAccount;
	}

	public Date getDepoDeadline() {
		return depoDeadline;
	}

	public void setDepoDeadline(Date depoDeadline) {
		this.depoDeadline = depoDeadline;
	}

	public String getDepoAccHolder() {
		return depoAccHolder;
	}

	public void setDepoAccHolder(String depoAccHolder) {
		this.depoAccHolder = depoAccHolder;
	}

	public int getEntryfee() {
		return entryfee;
	}

	public void setEntryfee(int entryfee) {
		this.entryfee = entryfee;
	}

	public int getMinParty() {
		return minParty;
	}

	public void setMinParty(int minParty) {
		this.minParty = minParty;
	}

	public int getMaxParty() {
		return maxParty;
	}

	public void setMaxParty(int maxParty) {
		this.maxParty = maxParty;
	}

	public String getCheifId() {
		return cheifId;
	}

	public void setCheifId(String cheifId) {
		this.cheifId = cheifId;
	}

	public String getDepoCondition() {
		return depoCondition;
	}

	public void setDepoCondition(String depoCondition) {
		this.depoCondition = depoCondition;
	}

	public Date getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(Date meetTime) {
		this.meetTime = meetTime;
	}

	public Date getDeadlineTime() {
		return deadlineTime;
	}

	public void setDeadlineTime(Date deadlineTime) {
		this.deadlineTime = deadlineTime;
	}

	@Override
	public String toString() {
		return "Meeting [meetNo=" + meetNo + ", post=" + post + ", depoAmount=" + depoAmount + ", depoBank=" + depoBank
				+ ", depoAccount=" + depoAccount + ", depoDeadline=" + depoDeadline + ", depoAccHolder=" + depoAccHolder
				+ ", entryfee=" + entryfee + ", minParty=" + minParty + ", maxParty=" + maxParty + ", cheifId="
				+ cheifId + ", depoCondition=" + depoCondition + ", meetTime=" + meetTime + ", deadlineTime="
				+ deadlineTime + "]";
	}
}
