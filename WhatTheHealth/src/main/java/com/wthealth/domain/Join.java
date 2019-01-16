package com.wthealth.domain;

import java.sql.Date;

public class Join {
	
	///Field
	private int joinNo;
	private Date joinDate;
	private String joinStatus;
	private String depoStatus;
	private String postNo;
	private String partyId;
	private String deleteStatus;
	private Date meetTime;
	
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

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
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

	@Override
	public String toString() {
		return "Join [joinNo=" + joinNo + ", joinDate=" + joinDate + ", joinStatus=" + joinStatus + ", depoStatus="
				+ depoStatus + ", postNo=" + postNo + ", partyId=" + partyId + ", deleteStatus=" + deleteStatus
				+ ", meetTime=" + meetTime + "]";
	}
	
}
