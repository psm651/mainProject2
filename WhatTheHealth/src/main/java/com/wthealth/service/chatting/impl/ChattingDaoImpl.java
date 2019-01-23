package com.wthealth.service.chatting.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.domain.Chatting;
import com.wthealth.service.chatting.ChattingDao;

@Repository("chattingDaoImpl")
public class ChattingDaoImpl implements ChattingDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ChattingDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addChatting(Chatting chatting) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ChattingMapper.addChatting", chatting);
	}

	@Override
	public Chatting getChatting(int chattingNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChattingMapper.getChatting", chattingNo);
	}

	@Override
	public List<Chatting> listChatting(String userId2) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ChattingMapper.listChatting", userId2);
	}

}
