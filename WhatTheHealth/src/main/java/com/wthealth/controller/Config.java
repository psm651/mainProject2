package com.wthealth.controller;

public final class Config {
	public static final String appid = "BIt_Project";
	public static final String apikey = "90df16b2fd3911e88f460cc47a1fcfae";
	public static String content;
	public static final String sender = "01092968532";
	private static String receiver;
	
	/*private String appid = "BIt_Project";
	private String apikey = "90df16b2fd3911e88f460cc47a1fcfae";
	private String content;
	private String sender;
	private String receiver;
	
	public Config() {
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getApikey() {
		return apikey;
	}

	public void setApikey(String apikey) {
		this.apikey = apikey;
	}*/

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
/*
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}
*/
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Config [appid=" + appid + ", apikey=" + apikey + ", content=" + content + ", sender=" + sender
				+ ", receiver=" + receiver + "]";
	}
	
	
}
