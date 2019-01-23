package com.wthealth.service.chatting;

import java.util.List;

import com.wthealth.domain.Chatting;

public interface ChattingDao {
	
	// INSERT
	public void addChatting(Chatting chatting) throws Exception ;
	
	// SELECT ONE
	public Chatting getChatting(int chattingNo) throws Exception ;
	
	// SELECT LIST
	public List<Chatting> listChatting(String userId2) throws Exception ;

}
