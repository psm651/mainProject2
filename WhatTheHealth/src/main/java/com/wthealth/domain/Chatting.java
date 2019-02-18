package com.wthealth.domain;

public class Chatting {
	

	private int chattingNo;
	private String roomId;
	private String user1;
	private String user2;
	private String userImage;


	public Chatting() {
		// TODO Auto-generated constructor stub
	}


	public int getChattingNo() {
		return chattingNo;
	}


	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}


	public String getRoomId() {
		return roomId;
	}


	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}


	public String getUser1() {
		return user1;
	}


	public void setUser1(String user1) {
		this.user1 = user1;
	}


	public String getUser2() {
		return user2;
	}


	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public String getUserImage() {
		return userImage;
	}


	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}


	@Override
	public String toString() {
		return "Chatting [chattingNo=" + chattingNo + ", roomId=" + roomId + ", user1=" + user1 + ", user2=" + user2
				+ ", userImage=" + userImage + "]";
	}


	


}
