package com.wthealth.service.exschedule.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.ExSchedule;
import com.wthealth.domain.Food;
import com.wthealth.service.exschedule.ExScheduleService;

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
public class ExScServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("exScheduleServiceImpl")
	private ExScheduleService exScheduleService;

	//@Test
	public void testAddExSc() throws Exception {
		

		
		ExSchedule exSchedule = new ExSchedule();
		
		exSchedule.setExScCalorie(150);
		exSchedule.setExScContents("죽여주네요");
		exSchedule.setExScName("물구나무");
		exSchedule.setUserId("testUser");
		
		exScheduleService.addExSchedule(exSchedule); 

		//==> console 확인
		System.out.println("test쪽"+exSchedule);
		
		//==> API 확인
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("죽여주네요", exSchedule.getExScContents());
		Assert.assertEquals("물구나무", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
	}
	
	/*//@Test
	public void testAddMeal() throws Exception {
		
		Food food1 = new Food();
		food1.setAmountFood(500);
		food1.setFoodCalorie(500);
		food1.setFoodName("바나나");
		
		Food food2 = new Food();
		food2.setAmountFood(100);
		food2.setFoodCalorie(1500);
		food2.setFoodName("소곱창");
		
		List<Food> food = new ArrayList<Food>();
		
		
		food.add(food1);
		food.add(food2);
		
		
		DietSchedule dietSchedule = new DietSchedule();
		
		dietSchedule.setUserId("testUser");
		dietSchedule.setBmi(25);
	
		dietSchedule.setMealTime("2");
		dietSchedule.setWeight(170);
		dietScheduleService.addDietSchedule(dietSchedule);
		System.out.println("다이어트스케줄넘버"+dietSchedule.getDietScNo());
		System.out.println("푸드1번"+food.get(1).getFoodName());
		System.out.println("푸드사이즈"+food.size());
		for (int i = 0; i < food.size(); i++) {
			food.get(i).setDietScNo(dietSchedule.getDietScNo());
			dietScheduleService.addMeal((Food)food.get(i));
		}
		
		//==> API 확인
		Assert.assertEquals(500, food1.getAmountFood());
		Assert.assertEquals(500, food1.getFoodCalorie());
		Assert.assertEquals("바나나", food1.getFoodName());
		Assert.assertEquals(dietSchedule.getDietScNo(), food1.getDietScNo());
		
		
	}
	*/
	
	
	//@Test
	public void testGetExSChedule() throws Exception {
		
		ExSchedule exSchedule = new ExSchedule();
		//==> 필요하다면...
		//user.setUserId("testUserId");
		//user.setUserName("testUserName");
		//user.setPassword("testPasswd");
		//user.setSsn("1111112222222");
		//user.setPhone("111-2222-3333");
		//user.setAddr("경기도");
		//user.setEmail("test@test.com");
		
		exSchedule = exScheduleService.getExSchedule(10026);

		//==> console 확인
		System.out.println(exSchedule);
		
		//==> API 확인
		
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("죽여주네요", exSchedule.getExScContents());
		Assert.assertEquals("물구나무", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
		
	}
	
	
	//@Test
	 public void testUpdateExSc() throws Exception{
		 ExSchedule exSchedule = exScheduleService.getExSchedule(10026);
			
			exSchedule.setExScCalorie(150);
			exSchedule.setExScContents("발라버려");
			exSchedule.setExScName("땅강아지");
			exSchedule.setUserId("testUser");
			exScheduleService.updateExSchedule(exSchedule); 
		
	
		System.out.println(exSchedule);
		Assert.assertNotNull(exSchedule); 
		
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("발라버려", exSchedule.getExScContents());
		Assert.assertEquals("땅강아지", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
	
	 }
		
	 /*
	 //==>  주석을 풀고 실행하면....
	 @Test
	 public void testGetProductListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = claimService.listClaim(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	search.setSearchFilter("1");
	 	map = claimService.listClaim(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3개 당 리스트 갯수 : "+totalCount);
	 }
	 */
	
	@Test
		 public void deleteExSchedule() throws Exception{
			 
		 	ExSchedule exSchedule = exScheduleService.getExSchedule(10026);
		 	Assert.assertNotNull(exSchedule); 
		 	
		 	
			//==> console 확인
		 	
		 	exScheduleService.deleteExSchedule(10026);
		 	System.out.println("12312312312"+exSchedule);
		 	Assert.assertEquals("1", exSchedule.getDeleteStatus());
		 }
		 /*
	 @Test
	 public void testGetProductListByProductName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("토끼");
	 	search.setSearchPriceCondition("1");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());	//현재시간 왜 입력?
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetProductListByPrice() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("100");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 */
	 
}