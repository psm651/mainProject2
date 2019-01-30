package com.wthealth.service.chatting.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.domain.Chatting;
import com.wthealth.service.chatting.ChattingDao;
import com.wthealth.service.chatting.ChattingService;

@Service("chattingServiceImpl")
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	@Qualifier("chattingDaoImpl")
	private ChattingDao chattingDao;
	public void setPointDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}

	public ChattingServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addChatting(Chatting chatting) throws Exception {
		// TODO Auto-generated method stub
		chattingDao.addChatting(chatting);
	}

	@Override
	public Chatting getChatting(int chattingNo) throws Exception {
		// TODO Auto-generated method stub
		return chattingDao.getChatting(chattingNo);
	}
	
	@Override
	public Chatting getChatting(String roomId) throws Exception{
		return chattingDao.getChatting(roomId);
	}

	@Override
	public List<Chatting> listChatting1(String userId2) throws Exception {
		// TODO Auto-generated method stub
		return chattingDao.listChatting1(userId2);
	}
	
	@Override
	public List<Chatting> listChatting2(String userId1) throws Exception {
		// TODO Auto-generated method stub
		return chattingDao.listChatting2(userId1);
	}
	
	

}
