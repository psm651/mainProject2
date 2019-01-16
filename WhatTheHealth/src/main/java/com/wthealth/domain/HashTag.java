package com.wthealth.domain;

public class HashTag {
	
	private int hashTagNo;
	private String hashTag;
	private String postNo;
	 
	
	public int getHashTagNo() {
		return hashTagNo;
	}
	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	@Override
	public String toString() {
		return "HashTag [hashTagNo=" + hashTagNo + ", hashTag=" + hashTag + ", postNo=" + postNo + "]";
	}
	

}