package com.wthealth.service.reply.test;

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
import com.wthealth.domain.Reply;
import com.wthealth.service.reply.ReplyService;

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
public class ReplyServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	//@Test
	public void testAddReply() throws Exception {
		
		Reply reply = new Reply();
		
		reply.setText("추가가 되나요?");
		reply.setPostNo("ME10000");
		reply.setWriterId("user2");
		
		
		replyService.addReply(reply);
		reply = replyService.getReply(reply.getReplyNo());
		//==> console 확인
		System.out.println(reply);
		
		//==> API 확인
		Assert.assertEquals("추가가 되나요?", reply.getText());
		Assert.assertEquals("ME10000", reply.getPostNo());
		Assert.assertEquals("user2", reply.getWriterId());
	}
	
	@Test
	public void testAddReReply() throws Exception {
		Reply reply = new Reply();
		
		reply.setText("추가추가");
		reply.setPostNo("ME10000");
		reply.setWriterId("user1");
		reply.setParentReplyNo(10001);
		reply.setReReplyNo(1);
		
		
		replyService.addReReply(reply);
		reply = replyService.getReply(reply.getReplyNo());
		
		//==> console 확인
		System.out.println(reply);
				
		//==> API 확인
		Assert.assertEquals("추가추가", reply.getText());
		Assert.assertEquals("ME10000", reply.getPostNo());
		Assert.assertEquals("user1", reply.getWriterId());
		Assert.assertEquals(10001, reply.getParentReplyNo());
		Assert.assertEquals(1, reply.getReReplyNo());
	}
	
	//@Test
	public void testGetReply() throws Exception {
		Reply reply = new Reply();
			
			
		reply = replyService.getReply(10005);
			
		//==> console 확인
		System.out.println(reply);
					
		//==> API 확인
		Assert.assertEquals("란라니야", reply.getText());
		Assert.assertEquals("ME10000", reply.getPostNo());
		Assert.assertEquals("user1", reply.getWriterId());
		Assert.assertEquals(10001, reply.getParentReplyNo());
		Assert.assertEquals(1, reply.getReReplyNo());
	}
	
	//@Test
	public void testDeleteReply() throws Exception {
		Reply reply = replyService.getReply(10007);
		Assert.assertNotNull(reply);
		
		replyService.deleteReply(10007);
		reply = replyService.getReply(10007);
		Assert.assertEquals("1", reply.getDeleteStatus());
	}
	
	//@Test
	public void testListReply() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = replyService.listReply(search, "ME10000");
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	/*search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3개 당 리스트 갯수 : "+totalCount);*/
	}
	
	//@Test
	public void testListMyReply() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = replyService.listMyReply(search, "user2");
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//==> console 확인
	 	System.out.println(list);
	 	Assert.assertEquals(2, list.size());
	 	
	 	
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	/*search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size()); */
	 	
	 	//==> console 확인
	 	System.out.println("purchase list all 리스트 : "+list);
	 	
	 	//totalCount = (Integer)map.get("totalCount");
	 	System.out.println("purchase list all 3개 당 리스트 갯수 : "+totalCount);
	}
	 
}