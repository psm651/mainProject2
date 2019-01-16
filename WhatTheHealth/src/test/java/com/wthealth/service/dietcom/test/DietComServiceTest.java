package com.wthealth.service.dietcom.test;

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
import com.wthealth.service.dietcom.DietComService;

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
public class DietComServiceTest {

	
	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
		@Autowired
		@Qualifier("dietComServiceImpl")
		private DietComService dietComService;
		
		/*@Test 
		  public void testAddDietCom() throws Exception{
		  
		  Post post = new Post();
		  
		  post.setPostNo("DC10010"); 
		  post.setUserId("user2");
		  post.setTitle("�����ؼ� ��¯����"); 
		  post.setContents("�����");
		  
		  dietComService.addDietCom(post);
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("�����ؼ� ��¯����", post.getTitle());
		  Assert.assertEquals("�����", post.getContents());
	
		}*/
		
		/* @Test
		  public void testGetDietCom() throws Exception{
		  
		  Post post = new Post();
		  
		  post = dietComService.getDietCom("DC10010");
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("�����ؼ� ��¯����", post.getTitle()); 
		  Assert.assertEquals("�����", post.getContents());
	 	  }*/
		
		/*@Test
		  public void testUpdateDietCom() throws Exception{
		  
		  Post post = dietComService.getDietCom("DC10010"); 
		  Assert.assertNotNull(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("�����ؼ� ��¯����", post.getTitle()); 
		  Assert.assertEquals("�����",post.getContents());
		  
		  post.setUserId("user3"); 
		  post.setTitle("�����̶�");
		  post.setContents("�µ���");
		  
		  dietComService.updateDietCom(post);
		  
		  post = dietComService.getDietCom("DC10010"); 
		  Assert.assertNotNull(post);
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("user3", post.getUserId());
		  Assert.assertEquals("�����̶�", post.getTitle());
		  Assert.assertEquals("�µ���", post.getContents()); 
		  
		  }*/
		
		/*@Test
		public void testListDietComAll() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);

			Map<String, Object> map = dietComService.listDietCom(search);

			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(1, list.size());

			System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println("listDietCom totalCount : " + totalCount);

			System.out.println("=======================================");

			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("0");
			search.setSearchKeyword("~");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom�� List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComByTitle() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("0");
			search.setSearchKeyword("��");
			
			Map<String, Object> map = dietComService.listDietCom(search);

			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(1, list.size());

			System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println("listDietCom totalCount : " + totalCount);

			System.out.println("=======================================");

			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("0");
			search.setSearchKeyword("��");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom�� List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComByUserId() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("1");
			search.setSearchKeyword("user");
			
			Map<String, Object> map = dietComService.listDietCom(search);

			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(1, list.size());

			System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println("listDietCom totalCount : " + totalCount);

			System.out.println("=======================================");

			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("1");
			search.setSearchKeyword("user");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom�� List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComByContents() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("2");
			search.setSearchKeyword("��");
			
			Map<String, Object> map = dietComService.listDietCom(search);

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
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom�� List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComRecom() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("2");
			search.setSearchKeyword("��");
			
			Map<String, Object> map = dietComService.listDietCom(search);

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
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom�� List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom�� 3���� ����Ʈ ���� "+totalCount);

		}*/
		
}
