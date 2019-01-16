package com.wthealth.service.meeting;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;

public interface MeetingService {
	//INSERT 소모임
	public void addMeeting(Meeting meeting) throws Exception;

	//INSERT 소모임 to 게시물 table
	//public void addMeetingPost(Post post) throws Exception;
		
	//UPDATE 소모임
	//public void updateMeeting(Meeting meeting) throws Exception;
	
	//DELETE 소모임 -> (주의) Update 해야 함
	public void deleteMeeting(String postNo) throws Exception;
	
	//SELECT ONE 소모임
	public Meeting getMeeting(String postNo) throws Exception;
	
	//SELECT ONE 소모임 from 게시물 table
	public Post getMeetingPost(String postNo) throws Exception;
	
	//SELECT LIST 소모임
	public Map<String , Object> listMeeting(Search search) throws Exception;
	
	//INSERT 소모임참여
	public void addJoin(Join join) throws Exception;
	
	//DELETE 소모임참여
	public void deleteJoin(int joinNo) throws Exception;
	
	//SELECT LIST
	public Map<String , Object> listJoinedMeeting(Search search, String partyId) throws Exception;
		
	//SELECT ONE 소모임참여 (소모임 알림)
	public Join getJoin(int joinNo) throws Exception;
	
	//선금 상태 변경
	public void updateDeposit(int joinNo) throws Exception;
	
}
