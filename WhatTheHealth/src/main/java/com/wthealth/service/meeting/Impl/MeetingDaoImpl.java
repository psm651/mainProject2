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
		sqlSession.insert("MeetingMapper.addMeeting", meeting);
		meeting.getPost().setPostNo("ME"+meeting.getMeetNo());
		sqlSession.insert("MeetingMapper.addMeetingPost", meeting.getPost());
	}
	
	
	/*@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		// TODO Auto-generated method stub

	}*/

	@Override
	public void addMeetingPost(Post post) throws Exception {
		sqlSession.insert("MeetingMapper.addMeetingPost", post);
	}

	@Override
	public void deleteMeeting(String postNo) throws Exception {
		sqlSession.update("MeetingMapper.deleteMeeting", postNo);
	}

	@Override
	public Meeting getMeeting(String postNo) throws Exception {
		return sqlSession.selectOne("MeetingMapper.getMeeting", postNo);
	}

	@Override
	public Post getMeetingPost(String postNo) throws Exception {
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
	public Join getJoin(int joinNo)  throws Exception {
		return sqlSession.selectOne("MeetingMapper.getJoin", joinNo);
	}

	@Override
	public void updateDeposit(int joinNo) throws Exception {
		sqlSession.update("MeetingMapper.updateDeposit", joinNo);

	}

}
