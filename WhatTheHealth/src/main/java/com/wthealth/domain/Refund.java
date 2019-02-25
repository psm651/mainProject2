package com.wthealth.domain;

import java.sql.Date;

public class Refund {
	
	private int refundNo;
	private Date refundDate;
	private int refundMoney;
	private String bankName;
	private String holder;
	private String accountNum;
	private Date refundReqDate;
	private String userId;
	private String refundStatus; //0: 환급 예정, 1:환급 완료
	private String bankCode;
	private int dateOfBirth; //생년월일+한자리 ex)9404162 (accountHolderInfo)
	
	public Refund() {
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public int getRefundMoney() {
		return refundMoney;
	}

	public void setRefundMoney(int refundMoney) {
		this.refundMoney = refundMoney;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public Date getRefundReqDate() {
		return refundReqDate;
	}

	public void setRefundReqDate(Date refundReqDate) {
		this.refundReqDate = refundReqDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRefundStatus() {
		return refundStatus;
	}

	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public int getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(int dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Override
	public String toString() {
		return "Refund [refundNo=" + refundNo + ", refundDate=" + refundDate + ", refundMoney=" + refundMoney
				+ ", bankName=" + bankName + ", holder=" + holder + ", accountNum=" + accountNum + ", refundReqDate="
				+ refundReqDate + ", userId=" + userId + ", refundStatus=" + refundStatus + ", bankCode=" + bankCode
				+ ", dateOfBirth=" + dateOfBirth + "]";
	}



	
}
