package com.wthealth.service.socket.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Socket;
import com.wthealth.service.socket.SocketDao;
import com.wthealth.service.socket.SocketService;

@Service("socketServiceImpl")
public class SocketServiceImpl implements SocketService {
	///Field
	@Autowired
	@Qualifier("socketDaoImpl")
	private SocketDao socketDao;
	public void setSocketDao(SocketDao socketDao) {
		this.socketDao = socketDao;
	}

	///Constructor
	public SocketServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addLiveStream(Socket socket) throws Exception {
		socketDao.addLiveStream(socket);
	}

	@Override
	public Socket getLiveStream(int socketNo) throws Exception {
		return socketDao.getLiveStream(socketNo);
	}

	@Override
	public void deleteLiveStream(int socketNo) throws Exception {
		socketDao.deleteLiveStream(socketNo);
	}

	@Override
	public Map<String, Object> listLiveStream(Search search) throws Exception {
		List<Socket> list = socketDao.listLiveStream(search);
		int totalCount = socketDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
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

	}*/

}
