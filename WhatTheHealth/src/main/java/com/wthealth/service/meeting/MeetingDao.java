package com.wthealth.service.meeting;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;

public interface MeetingDao {
	//INSERT �Ҹ���
	public void addMeeting(Meeting meeting) throws Exception;
	
	//INSERT �Ҹ��� to �Խù� table
	//public void addMeeingPost(Post post) throws Exception;
	public void addMeetingPost(Post post) throws Exception;
	
	//UPDATE �Ҹ���
	public void updateMeeting(Meeting meeting) throws Exception;
	
	//DELETE �Ҹ��� -> (����) Update �ؾ� ��
	public void deleteMeeting(String postSubNo) throws Exception;
	
	//SELECT ONE �Ҹ���
	public Meeting getMeeting(int meetNo) throws Exception;
	
	//SELECT ONE �Ҹ��� from �Խù� table
	public Post getMeetingPost(int postNo) throws Exception;
	
	//SELECT LIST �Ҹ���
	public List<Meeting> listMeeting(Search search) throws Exception;
	
	//INSERT �Ҹ�������
	public void addJoin(Join join) throws Exception;
	
	//DELETE �Ҹ�������
	public void deleteJoin(int joinNo) throws Exception;
	
	public void updateJoinDeleteStatus(int joinNo) throws Exception;
	
	public Join getJoin(int joinNo) throws Exception;
	
	//SELECT LIST
	public List<Join> listJoinedMeeting(Search search, String partyId) throws Exception;
	
	//�Խ��� Page ó���� ���� ��üRow(totalCount)  return --> Meeting ��
	public int getTotalCount(Search search) throws Exception ;
	
	//�Խ��� Page ó���� ���� ��üRow(totalCount)  return --> JOIN ��
	public int getTotalCountJoin(String partyId) throws Exception;
	
	//SELECT ONE �Ҹ�������(�Ҹ��� �˸�)
	public Join getJoinMeeting(Join join) throws Exception;
	
	//SELECT LIST
	public List<Join> listJoin(int meetNo) throws Exception;
	
	//���� ���� ����
	public void updateDeposit(int joinNo) throws Exception;
	
	public void updateClickCount(Post post) throws Exception;
	
	public void updateLikeCount(Post post) throws Exception;
	
}
