package com.wthealth.domain;

public class Chatting {
	
	private int chattingNo;
	private String roomId;
	private String user1;
	private String user2;
	private String user1Status;
	private String user2Status;
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


	public String getUser1Status() {
		return user1Status;
	}


	public void setUser1Status(String user1Status) {
		this.user1Status = user1Status;
	}


	public String getUser2Status() {
		return user2Status;
	}


	public void setUser2Status(String user2Status) {
		this.user2Status = user2Status;
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
				+ ", user1Status=" + user1Status + ", user2Status=" + user2Status + ", userImage=" + userImage + "]";
	}


}
