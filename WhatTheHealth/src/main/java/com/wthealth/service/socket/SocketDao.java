package com.wthealth.service.socket;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Socket;

public interface SocketDao {
	//INSERT LiveStream
	public void addLiveStream(Socket socket) throws Exception;
	
	//SELECT ONE
	public Socket getLiveStream(int socketNo) throws Exception;
	
	//DELETE LiveStream -> (����) Update �ؾ� �� 
	public void deleteLiveStream(int socketNo) throws Exception;	
	
	//�Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception;
	
	//SELECT LIST
	public List<Socket> listLiveStream(Search search) throws Exception;
	
	//INSERT BattleStream
	//public void addBattleStream(Socket socket) throws Exception;
	
	//SELECT ONE
	//public Socket getBattleStream(int liveNo) throws Exception;
	
	//DELETE BattleStream -> (����) Update �ؾ� ��
	//public void deleteBattleStream(int liveNo) throws Exception;
	
	//addPlayer
	//public void addPlayer(String userId) throws Exception;
	
}
