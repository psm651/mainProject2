package com.wthealth.service.meeting.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
import com.wthealth.domain.Reply;
import com.wthealth.service.meeting.MeetingService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class MeetingServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;

	//@Test
	public void testAddMeeting() throws Exception {
		Date date = new Date(20190101);
		
		Meeting meeting = new Meeting();
		
		meeting.setCheifId("horannabi");
		meeting.setDepoCondition("0");
	//meeting.setMeetTime(date);

		System.out.println("�������� �ñ��� :: "+meeting.getMeetNo());
		meetingService.addMeeting(meeting);
		System.out.println("����� �ñ��� :: "+meeting.getMeetNo());
		meeting = meetingService.getMeeting(10026);
		
		//==> console Ȯ��
		System.out.println(meeting);
		
		//==> API Ȯ��
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}
	
	@Test
	public void testAddMeetingPostBoth() throws Exception{
		Date date = new Date(20190112);
		
		Meeting meeting = new Meeting();
		
		meeting.setCheifId("horannabi");
		meeting.setDepoCondition("0");
		//meeting.setMeetTime(date);
		
		Post post = new Post();
		post.setUserId("horannabi");
		post.setTitle("daoimpl���� �Ѵ� �ֱ�~");
		post.setContents("�ɰž�!");
		
		meeting.setPost(post);
		System.out.println(meeting);
		
		meetingService.addMeeting(meeting);
		/*post.setPostNo("ME"+meeting.getMeetNo());
		System.out.println(" postNo�� ������?:"+post);
		meetingService.addMeetingPost(post);*/
		Assert.assertEquals("horannabi", meeting.getPost().getUserId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("70-01-01", meeting.getMeetTime().toString());
	}
	
	//@Test
	/*public void testAddMeetingPost() throws Exception {
		Date date = new Date(20190101);
		
		Meeting meeting = new Meeting();
		Post post = new Post();
		post.setUserId("user3");
		post.setTitle("��϶� �Ҹ��� ����~~~");
		post.setContents("��¥ ��վ��~~~~~~");
		
		meeting.setPost(post);
		meeting.setCheifId("user3");
		meeting.setDepoCondition("0");
		meeting.setMeetTime(date);

		System.out.println("�������� �ñ��� :: "+meeting.getMeetNo());
		meetingService.addMeeting(meeting);
		post.setPostNo("ME"+meeting.getMeetNo());
		System.out.println("����� �ñ��� :: "+meeting.getMeetNo());
		meetingService.addMeetingPost(post);
		meeting = meetingService.getMeeting("ME10034");
		
		//==> console Ȯ��
		System.out.println(meeting);
		
		//==> API Ȯ��
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}*/
	
	//@Test
	public void testGetMeeting() throws Exception {
		Meeting meeting = meetingService.getMeeting(10034);
		
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}
	
	//@Test
	public void testDeleteMeeting() throws Exception {
		Post post = meetingService.getMeetingPost(10034);
		Assert.assertNotNull(post);
		
		//meetingService.deleteMeeting(10034);
		post = meetingService.getMeetingPost(10034);

		Assert.assertEquals("1", post.getDeleteStatus());
	}
	
	//@Test
	public void testAddJoin() throws Exception {
		Join join = new Join();
		
		join.setJoinStatus("0");
		join.setDepoStatus("0");
		//join.setPostNo(10041);
		join.setPartyId("user1");
		
	
		meetingService.addJoin(join);
		join = meetingService.getJoin(join.getJoinNo());
		
		//==> console Ȯ��
		System.out.println(join);
		
		//==> API Ȯ��
		Assert.assertEquals("user1", join.getPartyId());
		Assert.assertEquals("0", join.getDepoStatus());
	}
	
	//@Test
	public void testDeleteJoin() throws Exception {
		Join join = meetingService.getJoin(10001);
		Assert.assertNotNull(join);
		
		meetingService.deleteJoin(10001);
		join= meetingService.getJoin(10001);
		Assert.assertEquals("1", join.getDeleteStatus());
	}
	
	//@Test
	public void testUpdateDeposit() throws Exception {
		Join join = meetingService.getJoin(10002);
		Assert.assertNotNull(join);
		
		meetingService.updateDeposit(10002);
		join= meetingService.getJoin(10002);
		Assert.assertEquals("1", join.getDepoStatus());
	}
	
	//@Test
	public void testListMeeting() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = meetingService.listMeeting(search);
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("2");
	 	search.setSearchFilter("0");
	 	map = meetingService.listMeeting(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3�� �� ����Ʈ ���� : "+totalCount);
	}
	
	//@Test
	public void testListJoin() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = meetingService.listJoinedMeeting(search, "user1");
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchFilter("1");
	 	map = meetingService.listJoinedMeeting(search, "user1");
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3�� �� ����Ʈ ���� : "+totalCount);
	}
	 
}