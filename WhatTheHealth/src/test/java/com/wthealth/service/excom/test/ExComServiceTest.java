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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class ExComServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("exComServiceImpl")
	private ExComService exComService;

	/*
	  @Test 
	  public void testAddExCom() throws Exception{
	  
	  Post post = new Post();
	  
	  post.setPostNo("EC10005"); 
	  post.setUserId("user1");
	  post.setTitle("실행되나여~~~"); 
	  post.setContents("가즈아");
	  
	  exComService.addExCom(post);
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("EC10005", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("실행되나여~~~", post.getTitle()); 
	  Assert.assertEquals("가즈아",  post.getContents()); }
	 */

	/*
	  @Test
	  public void testGetExCom() throws Exception{
	  
	  Post post = new Post();
	  
	  post = exComService.getExCom("EC10007");
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("EC10007", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("실행되나여~~~", post.getTitle()); 
	  Assert.assertEquals("가즈아", post.getContents());
 	  }
	 */

	
	/*  @Test
	  public void testUpdateExCom() throws Exception{
	  
	  Post post = exComService.getExCom("EC10007"); 
	  Assert.assertNotNull(post);
	  
	  Assert.assertEquals("EC10007", post.getPostNo());
	  Assert.assertEquals("user1", post.getUserId());
	  Assert.assertEquals("실행되나여~~~", post.getTitle()); 
	  Assert.assertEquals("가즈아",post.getContents());
	  
	  post.setUserId("user2"); 
	  post.setTitle("업데이뚜");
	  post.setContents("무어시");
	  
	  exComService.updateExCom(post);
	  
	  post = exComService.getExCom("EC10007"); 
	  Assert.assertNotNull(post);
	  
	  System.out.println(post);
	  
	  Assert.assertEquals("user2", post.getUserId());
	  Assert.assertEquals("업데이뚜", post.getTitle());
	  Assert.assertEquals("무어시", post.getContents()); 
	  
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
		search.setSearchKeyword("업데이뚜");
		map = exComService.listExCom(search);
		
		list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	System.out.println("listExCom의 List"+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

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
		search.setSearchKeyword("무");
		
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
		search.setSearchKeyword("온");
		
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
		search.setSearchKeyword("온");
		map = exComService.listExCom(search);
		
		list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	System.out.println("listExCom의 List"+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("listExCom의 3개당 리스트 갯수 "+totalCount);

	}
}
