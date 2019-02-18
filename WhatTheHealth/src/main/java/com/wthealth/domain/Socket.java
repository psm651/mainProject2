package com.wthealth.domain;

import java.sql.Date;

public class Socket {
	
	///Field
	private int socketNo;
	private String bjId;
	private Date liveDate;
	private String liveTitle;
	private int totalViewer;
	private String liveType;
	private String liveStatus;
	private String userImage;
	private String nickname;
	
	///Constructor
	public Socket() {
	}

	///Method
	public int getSocketNo() {
		return socketNo;
	}

	public void setSocketNo(int socketNo) {
		this.socketNo = socketNo;
	}

	public String getBjId() {
		return bjId;
	}

	public void setBjId(String bjId) {
		this.bjId = bjId;
	}

	public Date getLiveDate() {
		return liveDate;
	}

	public void setLiveDate(Date liveDate) {
		this.liveDate = liveDate;
	}

	public String getLiveTitle() {
		return liveTitle;
	}

	public void setLiveTitle(String liveTitle) {
		this.liveTitle = liveTitle;
	}

	public int getTotalViewer() {
		return totalViewer;
	}

	public void setTotalViewer(int totalViewer) {
		this.totalViewer = totalViewer;
	}

	public String getLiveType() {
		return liveType;
	}

	public void setLiveType(String liveType) {
		this.liveType = liveType;
	}


	public String getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(String liveStatus) {
		this.liveStatus = liveStatus;
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
		return "Socket [socketNo=" + socketNo + ", bjId=" + bjId + ", liveDate=" + liveDate + ", liveTitle=" + liveTitle
				+ ", totalViewer=" + totalViewer + ", liveType=" + liveType + ", liveStatus=" + liveStatus
				+ ", userImage=" + userImage + ", nickname=" + nickname + "]";
	}



}
