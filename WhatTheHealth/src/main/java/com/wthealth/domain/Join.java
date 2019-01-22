package com.wthealth.domain;

import java.sql.Date;

public class Join {
	
	///Field
	private int joinNo;
	private Date joinDate;
	private String joinStatus;
	private String depoStatus;
	private int postNo;
	private String partyId;
	private String deleteStatus;
	private Date meetTime;
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

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
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

	
	public Date getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(Date meetTime) {
		this.meetTime = meetTime;
	}

	public String getMeetTitle() {
		return meetTitle;
	}

	public void setMeetTitle(String meetTitle) {
		this.meetTitle = meetTitle;
	}

	@Override
	public String toString() {
		return "Join [joinNo=" + joinNo + ", joinDate=" + joinDate + ", joinStatus=" + joinStatus + ", depoStatus="
				+ depoStatus + ", postNo=" + postNo + ", partyId=" + partyId + ", deleteStatus=" + deleteStatus
				+ ", meetTime=" + meetTime + ", meetTitle=" + meetTitle + "]";
	}
}
