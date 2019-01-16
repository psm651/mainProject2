package com.wthealth.service.socket;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Socket;

public interface SocketDao {
	//INSERT LiveStream
	public void addLiveStream(Socket socket) throws Exception;
	
	//SELECT ONE
	public Socket getLiveStream(int socketNo) throws Exception;
	
	//DELETE LiveStream -> (주의) Update 해야 함 
	public void deleteLiveStream(int socketNo) throws Exception;	
	
	//게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception;
	
	//SELECT LIST
	public List<Socket> listLiveStream(Search search) throws Exception;
	
	//INSERT BattleStream
	//public void addBattleStream(Socket socket) throws Exception;
	
	//SELECT ONE
	//public Socket getBattleStream(int liveNo) throws Exception;
	
	//DELETE BattleStream -> (주의) Update 해야 함
	//public void deleteBattleStream(int liveNo) throws Exception;
	
	//addPlayer
	//public void addPlayer(String userId) throws Exception;
	
}
