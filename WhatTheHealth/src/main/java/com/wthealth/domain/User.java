package com.wthealth.domain;

import java.sql.Date;

public class User {
	
	///Field
	private String userId;
	private String password;
	private String nickName;
	private String email;
	private String userImage;
	private String gender;
	private String phone;
	private Date regDate;
	private Date dltDate;
	private String holder;
	private String bankName;
	private String accountNum;
	private int claimCount;
	private String userStatus;
	private int havingPoint;
	private String role;
	private String snsType;
	private String idToken;
	private String accessToken;
	private String refreshToken;
	
	///Constructor
	public User(){
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getDltDate() {
		return dltDate;
	}

	public void setDltDate(Date dltDate) {
		this.dltDate = dltDate;
	}

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public int getClaimCount() {
		return claimCount;
	}

	public void setClaimCount(int claimCount) {
		this.claimCount = claimCount;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public int getHavingPoint() {
		return havingPoint;
	}

	public void setHavingPoint(int havingPoint) {
		this.havingPoint = havingPoint;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getSnsType() {
		return snsType;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public String getIdToken() {
		return idToken;
	}

	public void setIdToken(String idToken) {
		this.idToken = idToken;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", nickName=" + nickName + ", email=" + email
				+ ", userImage=" + userImage + ", gender=" + gender + ", phone=" + phone + ", regDate=" + regDate
				+ ", dltDate=" + dltDate + ", holder=" + holder + ", bankName=" + bankName + ", accountNum="
				+ accountNum + ", claimCount=" + claimCount + ", userStatus=" + userStatus + ", havingPoint="
				+ havingPoint + ", role=" + role + ", snsType=" + snsType + ", idToken=" + idToken + ", accessToken="
				+ accessToken + ", refreshToken=" + refreshToken + "]";
	}
	

}
