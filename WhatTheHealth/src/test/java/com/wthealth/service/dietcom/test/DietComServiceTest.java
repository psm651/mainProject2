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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class DietComServiceTest {

	
	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
		@Autowired
		@Qualifier("dietComServiceImpl")
		private DietComService dietComService;
		
		/*@Test 
		  public void testAddDietCom() throws Exception{
		  
		  Post post = new Post();
		  
		  post.setPostNo("DC10010"); 
		  post.setUserId("user2");
		  post.setTitle("스퀏해서 엉짱되자"); 
		  post.setContents("가즈아");
		  
		  dietComService.addDietCom(post);
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("스퀏해서 엉짱되자", post.getTitle());
		  Assert.assertEquals("가즈아", post.getContents());
	
		}*/
		
		/* @Test
		  public void testGetDietCom() throws Exception{
		  
		  Post post = new Post();
		  
		  post = dietComService.getDietCom("DC10010");
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("스퀏해서 엉짱되자", post.getTitle()); 
		  Assert.assertEquals("가즈아", post.getContents());
	 	  }*/
		
		/*@Test
		  public void testUpdateDietCom() throws Exception{
		  
		  Post post = dietComService.getDietCom("DC10010"); 
		  Assert.assertNotNull(post);
		  
		  Assert.assertEquals("DC10010", post.getPostNo());
		  Assert.assertEquals("user2", post.getUserId());
		  Assert.assertEquals("스퀏해서 엉짱되자", post.getTitle()); 
		  Assert.assertEquals("가즈아",post.getContents());
		  
		  post.setUserId("user3"); 
		  post.setTitle("업데이뚜");
		  post.setContents("온도니");
		  
		  dietComService.updateDietCom(post);
		  
		  post = dietComService.getDietCom("DC10010"); 
		  Assert.assertNotNull(post);
		  
		  System.out.println(post);
		  
		  Assert.assertEquals("user3", post.getUserId());
		  Assert.assertEquals("업데이뚜", post.getTitle());
		  Assert.assertEquals("온도니", post.getContents()); 
		  
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
		 	
		 	System.out.println("listDietCom의 List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComByTitle() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("0");
			search.setSearchKeyword("업");
			
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
			search.setSearchKeyword("업");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom의 List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

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
		 	
		 	System.out.println("listDietCom의 List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComByContents() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("2");
			search.setSearchKeyword("온");
			
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
			search.setSearchKeyword("온");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom의 List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

		}*/
		
		/*@Test
		public void testListDietComRecom() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("2");
			search.setSearchKeyword("온");
			
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
			search.setSearchKeyword("온");
			map = dietComService.listDietCom(search);
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		 	System.out.println("listDietCom의 List"+list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

		}*/
		
}
