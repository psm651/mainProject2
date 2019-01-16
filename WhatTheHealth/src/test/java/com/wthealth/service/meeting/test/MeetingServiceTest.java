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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class MeetingServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;

	//@Test
	public void testAddMeeting() throws Exception {
		Date date = new Date(20190101);
		
		Meeting meeting = new Meeting();
		
		meeting.setCheifId("user3");
		meeting.setDepoCondition("0");
		meeting.setMeetTime(date);

		System.out.println("실행전이 궁금함 :: "+meeting.getMeetNo());
		meetingService.addMeeting(meeting);
		System.out.println("결과가 궁금함 :: "+meeting.getMeetNo());
		meeting = meetingService.getMeeting("ME10026");
		
		//==> console 확인
		System.out.println(meeting);
		
		//==> API 확인
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}
	
	//@Test
	public void testAddMeetingPostBoth() throws Exception{
		Date date = new Date(20190112);
		
		Meeting meeting = new Meeting();
		
		meeting.setCheifId("user1");
		meeting.setDepoCondition("0");
		meeting.setMeetTime(date);
		
		Post post = new Post();
		post.setUserId("user1");
		post.setTitle("daoimpl에서 둘다 넣기~");
		post.setContents("될거야!");
		
		meeting.setPost(post);
		System.out.println(meeting);
		
		meetingService.addMeeting(meeting);
		/*post.setPostNo("ME"+meeting.getMeetNo());
		System.out.println(" postNo이 들어갔나요?:"+post);
		meetingService.addMeetingPost(post);*/
		Assert.assertEquals("user1", meeting.getPost().getUserId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}
	
	//@Test
	/*public void testAddMeetingPost() throws Exception {
		Date date = new Date(20190101);
		
		Meeting meeting = new Meeting();
		Post post = new Post();
		post.setUserId("user3");
		post.setTitle("라니랑 소모임 가여~~~");
		post.setContents("진짜 재밌어요~~~~~~");
		
		meeting.setPost(post);
		meeting.setCheifId("user3");
		meeting.setDepoCondition("0");
		meeting.setMeetTime(date);

		System.out.println("실행전이 궁금함 :: "+meeting.getMeetNo());
		meetingService.addMeeting(meeting);
		post.setPostNo("ME"+meeting.getMeetNo());
		System.out.println("결과가 궁금함 :: "+meeting.getMeetNo());
		meetingService.addMeetingPost(post);
		meeting = meetingService.getMeeting("ME10034");
		
		//==> console 확인
		System.out.println(meeting);
		
		//==> API 확인
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}*/
	
	//@Test
	public void testGetMeeting() throws Exception {
		Meeting meeting = meetingService.getMeeting("ME10034");
		
		Assert.assertEquals("user3", meeting.getCheifId());
		Assert.assertEquals("0", meeting.getDepoCondition());
		Assert.assertEquals("1970-01-01", meeting.getMeetTime().toString());
	}
	
	//@Test
	public void testDeleteMeeting() throws Exception {
		Post post = meetingService.getMeetingPost("ME10034");
		Assert.assertNotNull(post);
		
		meetingService.deleteMeeting("ME10034");
		post = meetingService.getMeetingPost("ME10034");

		Assert.assertEquals("1", post.getDeleteStatus());
	}
	
	//@Test
	public void testAddJoin() throws Exception {
		Join join = new Join();
		
		join.setJoinStatus("0");
		join.setDepoStatus("0");
		join.setPostNo("ME10041");
		join.setPartyId("user1");
		
	
		meetingService.addJoin(join);
		join = meetingService.getJoin(join.getJoinNo());
		
		//==> console 확인
		System.out.println(join);
		
		//==> API 확인
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
	
	@Test
	public void testListMeeting() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = meetingService.listMeeting(search);
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("2");
	 	search.setSearchFilter("0");
	 	map = meetingService.listMeeting(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3개 당 리스트 갯수 : "+totalCount);
	}
	
	//@Test
	public void testListJoin() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = meetingService.listJoinedMeeting(search, "user1");
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchFilter("1");
	 	map = meetingService.listJoinedMeeting(search, "user1");
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3개 당 리스트 갯수 : "+totalCount);
	}
	 
}