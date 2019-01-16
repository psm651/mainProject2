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
public class ReplyServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	//@Test
	public void testAddReply() throws Exception {
		
		Reply reply = new Reply();
		
		reply.setText("�߰��� �ǳ���?");
		reply.setPostNo("ME10000");
		reply.setWriterId("user2");
		
		
		replyService.addReply(reply);
		reply = replyService.getReply(reply.getReplyNo());
		//==> console Ȯ��
		System.out.println(reply);
		
		//==> API Ȯ��
		Assert.assertEquals("�߰��� �ǳ���?", reply.getText());
		Assert.assertEquals("ME10000", reply.getPostNo());
		Assert.assertEquals("user2", reply.getWriterId());
	}
	
	@Test
	public void testAddReReply() throws Exception {
		Reply reply = new Reply();
		
		reply.setText("�߰��߰�");
		reply.setPostNo("ME10000");
		reply.setWriterId("user1");
		reply.setParentReplyNo(10001);
		reply.setReReplyNo(1);
		
		
		replyService.addReReply(reply);
		reply = replyService.getReply(reply.getReplyNo());
		
		//==> console Ȯ��
		System.out.println(reply);
				
		//==> API Ȯ��
		Assert.assertEquals("�߰��߰�", reply.getText());
		Assert.assertEquals("ME10000", reply.getPostNo());
		Assert.assertEquals("user1", reply.getWriterId());
		Assert.assertEquals(10001, reply.getParentReplyNo());
		Assert.assertEquals(1, reply.getReReplyNo());
	}
	
	//@Test
	public void testGetReply() throws Exception {
		Reply reply = new Reply();
			
			
		reply = replyService.getReply(10005);
			
		//==> console Ȯ��
		System.out.println(reply);
					
		//==> API Ȯ��
		Assert.assertEquals("����Ͼ�", reply.getText());
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
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	/*search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3�� �� ����Ʈ ���� : "+totalCount);*/
	}
	
	//@Test
	public void testListMyReply() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = replyService.listMyReply(search, "user2");
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	Assert.assertEquals(2, list.size());
	 	
	 	
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	/*search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size()); */
	 	
	 	//==> console Ȯ��
	 	System.out.println("purchase list all ����Ʈ : "+list);
	 	
	 	//totalCount = (Integer)map.get("totalCount");
	 	System.out.println("purchase list all 3�� �� ����Ʈ ���� : "+totalCount);
	}
	 
}