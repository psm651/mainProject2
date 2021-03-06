package com.wthealth.service.meeting.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
import com.wthealth.service.meeting.MeetingDao;
import com.wthealth.service.meeting.MeetingService;

@Service("meetingServiceImpl")
public class MeetingServiceImpl implements MeetingService {
	///Field
	@Autowired
	@Qualifier("meetingDaoImpl")
	private MeetingDao meetingDao;
	public void setMeetingDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
	}

	///Constructor
	public MeetingServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	///Method
	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		//int meetNo = meetingDao.addMeeting(meeting);
		//meetingDao.addMeetingPost();
		meetingDao.addMeeting(meeting);
		//meetingDao.addMeeingPost(post);
	}
	
	/*@Override
	public void addMeetingPost(Post post) throws Exception {
		meetingDao.addMeetingPost(post);	
	}*/

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		meetingDao.updateMeeting(meeting);
	}
	
	
	
	@Override
	public void updateClickCount(Post post) throws Exception {
		meetingDao.updateClickCount(post);
	}

	@Override
	public void updateLikeCount(Post post) throws Exception {
		meetingDao.updateLikeCount(post);
	}

	@Override
	public void deleteMeeting(String postSubNo) throws Exception {
		meetingDao.deleteMeeting(postSubNo);
	}

	

	@Override
	public Meeting getMeeting(int meetNo) throws Exception {
		return meetingDao.getMeeting(meetNo);
	}

	@Override
	public Post getMeetingPost(int postNo) throws Exception {
		return meetingDao.getMeetingPost(postNo);
	}

	@Override
	public Map<String, Object> listMeeting(Search search) throws Exception {
		List<Meeting> list = meetingDao.listMeeting(search);
		int totalCount = meetingDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void addJoin(Join join) throws Exception {
		meetingDao.addJoin(join);
	}

	@Override
	public void deleteJoin(int joinNo) throws Exception {
		meetingDao.deleteJoin(joinNo);
	}

	@Override
	public Map<String, Object> listJoinedMeeting(Search search, String partyId) throws Exception {
		List<Join> list = meetingDao.listJoinedMeeting(search, partyId);
		int totalCount = meetingDao.getTotalCountJoin(partyId);
		
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Join getJoinMeeting(Join join)  throws Exception {
		return meetingDao.getJoinMeeting(join);
	}

	@Override
	public Join getJoin(int joinNo)  throws Exception {
		return meetingDao.getJoin(joinNo);
	}
	
	@Override
	public void updateDeposit(int joinNo) throws Exception {
		meetingDao.updateDeposit(joinNo);
	}

	@Override
	public Map<String, Object> getMeetingMap(int meetNo) throws Exception {
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("meeting", meetingDao.getMeeting(meetNo));
		map.put("joinlist", meetingDao.listJoin(meetNo));
		
		return map;
	}

	@Override
	public void updateJoinDeleteStatus(int joinNo) throws Exception {
		meetingDao.updateJoinDeleteStatus(joinNo);
		
	}
	
	

}
