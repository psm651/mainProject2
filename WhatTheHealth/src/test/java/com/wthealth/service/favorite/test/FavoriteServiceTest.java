package com.wthealth.service.favorite.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteService;

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
public class FavoriteServiceTest {
	
	
	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
		@Autowired
		@Qualifier("favoriteServiceImpl")
		private FavoriteService favoriteService;
		
		/*@Test
		public void testAddLike() throws Exception{
			
			Favorite like = new Favorite();
			
			like.setFavoriteNo(10010);
			like.setUserId("user");
			like.setPostNo("DC10010");
			like.setFavoriteType(1);
			
			System.out.println(like);
			
			Assert.assertEquals(10010, like.getFavoriteNo());
			
		}*/
		
		/*@Test
		public void testAddInterest() throws Exception{
			
			Favorite interest = new Favorite();
			
			interest.setUserId("user1");
			interest.setPostNo("DC10010");
			interest.setFavoriteType(1);
			
			favoriteService.addInterest(interest);
			
			System.out.println(interest);
			
			Assert.assertEquals("DC10010", interest.getPostNo());
			
		}*/
		
		/*@Test
		public void testListMyInterest() throws Exception{
			
			Favorite interest = new Favorite();
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			
			Map<String, Object> map = favoriteService.listMyInterest(search, "user1");
			
			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(2, list.size());

			System.out.println(list);
			
			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println("listDietCom totalCount : " + totalCount);

			System.out.println("=======================================");
			
			map = favoriteService.listMyInterest(search, "user1");
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(2, list.size());
		 	
		}*/
		
		@Test
		public void testListLikePeople() throws Exception{
			
			Favorite like = new Favorite();
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			
			Map<String, Object> map = favoriteService.listLikePeople(search, "EC10000");
			
			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(1, list.size());

			System.out.println(list);
			
			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println("listDietCom totalCount : " + totalCount);

			System.out.println("=======================================");
			
			map = favoriteService.listLikePeople(search, "EC10000");
			
			list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
		}
}
