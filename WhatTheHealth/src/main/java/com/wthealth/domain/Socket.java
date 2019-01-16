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
	private String firPlayerId;
	private String secPlayerId;
	private String liveStatus;
	
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

	public String getFirPlayerId() {
		return firPlayerId;
	}

	public void setFirPlayerId(String firPlayerId) {
		this.firPlayerId = firPlayerId;
	}

	public String getSecPlayerId() {
		return secPlayerId;
	}

	public void setSecPlayerId(String secPlayerId) {
		this.secPlayerId = secPlayerId;
	}

	public String getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(String liveStatus) {
		this.liveStatus = liveStatus;
	}

	@Override
	public String toString() {
		return "Socket [socketNo=" + socketNo + ", bjId=" + bjId + ", liveDate=" + liveDate + ", liveTitle=" + liveTitle
				+ ", totalViewer=" + totalViewer + ", liveType=" + liveType + ", firPlayerId=" + firPlayerId
				+ ", secPlayerId=" + secPlayerId + ", liveStatus=" + liveStatus + "]";
	}
}
