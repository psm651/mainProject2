package com.wthealth.domain;

public class Claim {
	
	private int claimNo;
	private String userId;
	private String claimedUserId;
	private String claimDate;
	private String claimSortNo;
	private String claimStatus;
	private String claimReasonNo;
	private String targetNo;
	private String claimContents;


	public Claim(){
	}

	public int getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(int claimNo) {
		this.claimNo = claimNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClaimedUserId() {
		return claimedUserId;
	}

	public void setClaimedUserId(String claimedUserId) {
		this.claimedUserId = claimedUserId;
	}

	public String getClaimDate() {
		return claimDate;
	}

	public void setClaimDate(String claimDate) {
		this.claimDate = claimDate;
	}

	public String getClaimSortNo() {
		return claimSortNo;
	}

	public void setClaimSortNo(String claimSortNo) {
		this.claimSortNo = claimSortNo;
	}

	public String getClaimStatus() {
		return claimStatus;
	}

	public void setClaimStatus(String claimStatus) {
		this.claimStatus = claimStatus;
	}

	public String getClaimReasonNo() {
		return claimReasonNo;
	}

	public void setClaimReasonNo(String claimReasonNo) {
		this.claimReasonNo = claimReasonNo;
	}

	public String getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(String targetNo) {
		this.targetNo = targetNo;
	}

	public String getClaimContents() {
		return claimContents;
	}

	public void setClaimContents(String claimContents) {
		this.claimContents = claimContents;
	} 

	@Override
	public String toString() {
		return "Claim [claimNo=" + claimNo + ", userId=" + userId + ", claimedUserId=" + claimedUserId + ", claimDate="
				+ claimDate + ", claimSortNo=" + claimSortNo + ", claimStatus=" + claimStatus + ", claimReasonNo="
				+ claimReasonNo + ", targetNo=" + targetNo + ", claimContents=" + claimContents + "]";
	}	
	
}
