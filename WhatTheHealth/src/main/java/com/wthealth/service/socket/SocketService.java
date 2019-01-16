package com.wthealth.service.socket;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Socket;

public interface SocketService {
	//INSERT LiveStream
	public void addLiveStream(Socket socket) throws Exception;
		
	//SELECT ONE
	public Socket getLiveStream(int socketNo) throws Exception;
		
	//DELETE LiveStream -> (주의) Update 해야 함
	public void deleteLiveStream(int socketNo) throws Exception;	
		
	//SELECT LIST
	public Map<String, Object> listLiveStream(Search search) throws Exception;
		
	/*//INSERT BattleStream
	public void addBattleStream(Socket socket) throws Exception;
		
	//SELECT ONE
	public Socket getBattleStream(int liveNo) throws Exception;
		
	//DELETE BattleStream -> (주의) Update 해야 함
	public void deleteBattleStream(int liveNo) throws Exception;
		
	//addPlayer
	public void addPlayer(String userId) throws Exception;*/
}
