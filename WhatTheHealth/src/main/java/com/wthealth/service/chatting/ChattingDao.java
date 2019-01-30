package com.wthealth.service.chatting;

import java.util.List;

import com.wthealth.domain.Chatting;

public interface ChattingDao {
	
	// INSERT
	public void addChatting(Chatting chatting) throws Exception ;
	
	// SELECT ONE
	public Chatting getChatting(int chattingNo) throws Exception ;
	
	// SELECT ONE
	public Chatting getChatting(String roomId) throws Exception ;
	
	// SELECT LIST
	public List<Chatting> listChatting1(String userId2) throws Exception ;
	
	// SELECT LIST
	public List<Chatting> listChatting2(String userId1) throws Exception ;

}
