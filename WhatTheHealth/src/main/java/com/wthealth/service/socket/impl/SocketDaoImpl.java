package com.wthealth.service.socket.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Socket;
import com.wthealth.service.socket.SocketDao;

@Repository("socketDaoImpl")
public class SocketDaoImpl implements SocketDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public SocketDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addLiveStream(Socket socket) throws Exception {
		sqlSession.insert("SocketMapper.addLiveStream", socket);
	}

	@Override
	public Socket getLiveStream(int socketNo) throws Exception {
		return sqlSession.selectOne("SocketMapper.getLiveStream", socketNo);
	}

	@Override
	public void deleteLiveStream(int socketNo) throws Exception {
		sqlSession.update("SocketMapper.deleteLiveStream", socketNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("SocketMapper.getTotalCount", search);
	}

	@Override
	public List<Socket> listLiveStream(Search search) throws Exception {
		return sqlSession.selectList("SocketMapper.listLiveStream", search);
	}

	/*@Override
	public void addBattleStream(Socket socket) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Socket getBattleStream(int liveNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBattleStream(int liveNo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void addPlayer(String userId) throws Exception {
		// TODO Auto-generated method stub

	}
*/
}
