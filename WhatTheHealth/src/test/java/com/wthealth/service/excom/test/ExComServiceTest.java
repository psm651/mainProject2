package com.wthealth.service.excom.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.excom.ExComService;

import junit.framework.Assert;

/*
 *	FileName :  ExComServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class ExComServiceTest {

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("exComServiceImpl")
	private ExComService exComService;

	/*
	  @Test 
	  public void testAddExCom() throws Exception{
	  
	  Post post = new Post();
	  
	  post.setPostNo("EC10005"); 
	  post.setUserId("user1");
	  post.setTitle("����ǳ���~~~"); 
	  post.setContents("�����");
	  
	  exComService.addExCom(post);
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("EC10005", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("����ǳ���~~~", post.getTitle()); 
	  Assert.assertEquals("�����",  post.getContents()); }
	 */

	/*
	  @Test
	  public void testGetExCom() throws Exception{
	  
	  Post post = new Post();
	  
	  post = exComService.getExCom("EC10007");
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("EC10007", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("����ǳ���~~~", post.getTitle()); 
	  Assert.assertEquals("�����", post.getContents());
 	  }
	 */

	
	/*  @Test
	  public void testUpdateExCom() throws Exception{
	  
	  Post post = exComService.getExCom("EC10007"); 
	  Assert.assertNotNull(post);
	  
	  Assert.assertEquals("EC10007", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("����ǳ���~~~", post.getTitle()); 
	  Assert.assertEquals("�����",post.getContents());
	  
	  post.setUserId("user2"); 
	  post.setTitle("�����̶�");
	  post.setContents("�����");
	  
	  exComService.updateExCom(post);
	  
	  post = exComService.getExCom("EC10007"); 
	  Assert.assertNotNull(post);
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("user2", post.getUserId());
	  Assert.assertEquals("�����̶�", post.getTitle());
	  Assert.assertEquals("�����", post.getContents()); 
	  
	  }*/
	 
	/*@Test
	public void testListExComAll() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);

		Map<String, Object> map = exComService.listExCom(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println("listExCom totalCount : " + totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("�����̶�");
		map = exComService.listExCom(search);
		
		list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	System.out.println("listExCom�� List"+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

	}*/
	
	/*@Test
	public void testListExComAllByTitle() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("user");
		
		Map<String, Object> map = exComService.listExCom(search);

		List<Object> list = (List<Object>) map.get("list");
		
		System.out.println(list);
	}*/
	
	/*@Test
	public void testListExComAllByUserId() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("user");
		
		Map<String, Object> map = exComService.listExCom(search);

		List<Object> list = (List<Object>) map.get("list");
		
		System.out.println(list);
	}*/
	
	/*@Test
	public void testListExComAllByContents() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("2");
		search.setSearchKeyword("��");
		
		Map<String, Object> map = exComService.listExCom(search);

		List<Object> list = (List<Object>) map.get("list");
		
		System.out.println(list);
	}*/
	
	@Test
	public void testListExComRecom() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		search.setSearchCondition("2");
		search.setSearchKeyword("��");
		
		Map<String, Object> map = exComService.listExCom(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(1, list.size());

		System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println("listDietCom totalCount : " + totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(1);
		search.setSearchCondition("2");
		search.setSearchKeyword("��");
		map = exComService.listExCom(search);
		
		list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	System.out.println("listExCom�� List"+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

	}
}
