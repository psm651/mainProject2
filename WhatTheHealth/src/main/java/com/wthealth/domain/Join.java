package com.wthealth.domain;

import java.sql.Date;

public class Join {
	
	///Field
	private int joinNo;
	private Date joinDate;
	private String joinStatus;
	private String depoStatus;
	private int meetNo;
	private String partyId;
	private String nickName;
	private String partyImage;
	private String deleteStatus;
	private String meetTime;
	private String meetTitle;
	
	
	///Constructor
	public Join() {
	}

	///Method
	public int getJoinNo() {
		return joinNo;
	}

	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getJoinStatus() {
		return joinStatus;
	}

	public void setJoinStatus(String joinStatus) {
		this.joinStatus = joinStatus;
	}

	public String getDepoStatus() {
		return depoStatus;
	}

	public void setDepoStatus(String depoStatus) {
		this.depoStatus = depoStatus;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public String getPartyId() {
		return partyId;
	}

	public void setPartyId(String partyId) {
		this.partyId = partyId;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	
	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getMeetTitle() {
		return meetTitle;
	}

	public void setMeetTitle(String meetTitle) {
		this.meetTitle = meetTitle;
	}

	public String getPartyImage() {
		return partyImage;
	}

	public void setPartyImage(String partyImage) {
		this.partyImage = partyImage;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Join [joinNo=" + joinNo + ", joinDate=" + joinDate + ", joinStatus=" + joinStatus + ", depoStatus="
				+ depoStatus + ", meetNo=" + meetNo + ", partyId=" + partyId + ", nickName=" + nickName
				+ ", partyImage=" + partyImage + ", deleteStatus=" + deleteStatus + ", meetTime=" + meetTime
				+ ", meetTitle=" + meetTitle + "]";
	}

	


}
