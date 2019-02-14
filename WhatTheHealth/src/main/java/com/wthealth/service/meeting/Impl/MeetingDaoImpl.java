package com.wthealth.service.meeting.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
import com.wthealth.service.meeting.MeetingDao;

@Repository("meetingDaoImpl")
public class MeetingDaoImpl implements MeetingDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MeetingDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		Post post = meeting.getPost();
		sqlSession.insert("MeetingMapper.addMeeting", meeting);
		
		post.setPostSubNo("ME"+meeting.getMeetNo());
		//post.setPostNo(meeting.getPost());
		//meeting.getPost().setPostNo("ME"+meeting.getMeetNo());
		sqlSession.insert("MeetingMapper.addMeetingPost", post);
	}
	
	
	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		Post post = meeting.getPost();
		sqlSession.update("MeetingMapper.updateMeeting", meeting);
		post.setPostSubNo("ME"+meeting.getMeetNo());
		
		sqlSession.update("MeetingMapper.updateMeetingPost", post);

	}
	
	

	@Override
	public void updateClickCount(Post post) throws Exception {
		sqlSession.update("MeetingMapper.updateClickCount", post);
	}

	@Override
	public void updateLikeCount(Post post) throws Exception {
		sqlSession.update("MeetingMapper.updateLikeCount", post);
	}

	@Override
	public void addMeetingPost(Post post) throws Exception {
		sqlSession.insert("MeetingMapper.addMeetingPost", post);
	}

	@Override
	public void deleteMeeting(String postSubNo) throws Exception{
		sqlSession.update("MeetingMapper.deleteMeeting", postSubNo);
	}

	@Override
	public Meeting getMeeting(int meetNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getMeeting", meetNo);
	}

	@Override
	public Post getMeetingPost(int postNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getMeetingPost", postNo);
	}

	@Override
	public List<Meeting> listMeeting(Search search) throws Exception {
		return sqlSession.selectList("MeetingMapper.listMeeting", search);
	}

	@Override
	public void addJoin(Join join) throws Exception {
		sqlSession.insert("MeetingMapper.addJoin", join);
	}

	@Override
	public void deleteJoin(int joinNo) throws Exception {
		sqlSession.update("MeetingMapper.deleteJoin", joinNo);
	}

	@Override
	public List<Join> listJoinedMeeting(Search search, String partyId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("partyId", partyId);
		return sqlSession.selectList("MeetingMapper.listJoinedMeeting", map);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getTotalCount", search);
	}

	@Override
	public int getTotalCountJoin(String partyId) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getTotalCountJoin", partyId);
	}

	@Override
	public Join getJoinMeeting(Join join)  throws Exception {
		return sqlSession.selectOne("MeetingMapper.getJoinMeeting", join);
	}

	@Override
	public void updateDeposit(int joinNo) throws Exception {
		sqlSession.update("MeetingMapper.updateDeposit", joinNo);

	}

	@Override
	public Join getJoin(int joinNo)  throws Exception {
		return sqlSession.selectOne("MeetingMapper.getJoin", joinNo);
	}
	
	@Override
	public List<Join> listJoin(int meetNo) throws Exception {
		return sqlSession.selectList("MeetingMapper.listJoin", meetNo);
	}

	@Override
	public void updateJoinDeleteStatus(int joinNo) throws Exception {
		sqlSession.update("MeetingMapper.updateJoinDeleteStatus", joinNo);
		
	}
	
	

}
