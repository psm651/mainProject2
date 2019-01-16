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
public class ExScServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("exScheduleServiceImpl")
	private ExScheduleService exScheduleService;

	//@Test
	public void testAddExSc() throws Exception {
		

		
		ExSchedule exSchedule = new ExSchedule();
		
		exSchedule.setExScCalorie(150);
		exSchedule.setExScContents("�׿��ֳ׿�");
		exSchedule.setExScName("��������");
		exSchedule.setUserId("testUser");
		
		exScheduleService.addExSchedule(exSchedule); 

		//==> console Ȯ��
		System.out.println("test��"+exSchedule);
		
		//==> API Ȯ��
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("�׿��ֳ׿�", exSchedule.getExScContents());
		Assert.assertEquals("��������", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
	}
	
	/*//@Test
	public void testAddMeal() throws Exception {
		
		Food food1 = new Food();
		food1.setAmountFood(500);
		food1.setFoodCalorie(500);
		food1.setFoodName("�ٳ���");
		
		Food food2 = new Food();
		food2.setAmountFood(100);
		food2.setFoodCalorie(1500);
		food2.setFoodName("�Ұ�â");
		
		List<Food> food = new ArrayList<Food>();
		
		
		food.add(food1);
		food.add(food2);
		
		
		DietSchedule dietSchedule = new DietSchedule();
		
		dietSchedule.setUserId("testUser");
		dietSchedule.setBmi(25);
	
		dietSchedule.setMealTime("2");
		dietSchedule.setWeight(170);
		dietScheduleService.addDietSchedule(dietSchedule);
		System.out.println("���̾�Ʈ�����ٳѹ�"+dietSchedule.getDietScNo());
		System.out.println("Ǫ��1��"+food.get(1).getFoodName());
		System.out.println("Ǫ�������"+food.size());
		for (int i = 0; i < food.size(); i++) {
			food.get(i).setDietScNo(dietSchedule.getDietScNo());
			dietScheduleService.addMeal((Food)food.get(i));
		}
		
		//==> API Ȯ��
		Assert.assertEquals(500, food1.getAmountFood());
		Assert.assertEquals(500, food1.getFoodCalorie());
		Assert.assertEquals("�ٳ���", food1.getFoodName());
		Assert.assertEquals(dietSchedule.getDietScNo(), food1.getDietScNo());
		
		
	}
	*/
	
	
	//@Test
	public void testGetExSChedule() throws Exception {
		
		ExSchedule exSchedule = new ExSchedule();
		//==> �ʿ��ϴٸ�...
		//user.setUserId("testUserId");
		//user.setUserName("testUserName");
		//user.setPassword("testPasswd");
		//user.setSsn("1111112222222");
		//user.setPhone("111-2222-3333");
		//user.setAddr("��⵵");
		//user.setEmail("test@test.com");
		
		exSchedule = exScheduleService.getExSchedule(10026);

		//==> console Ȯ��
		System.out.println(exSchedule);
		
		//==> API Ȯ��
		
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("�׿��ֳ׿�", exSchedule.getExScContents());
		Assert.assertEquals("��������", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
		
	}
	
	
	//@Test
	 public void testUpdateExSc() throws Exception{
		 ExSchedule exSchedule = exScheduleService.getExSchedule(10026);
			
			exSchedule.setExScCalorie(150);
			exSchedule.setExScContents("�߶����");
			exSchedule.setExScName("��������");
			exSchedule.setUserId("testUser");
			exScheduleService.updateExSchedule(exSchedule); 
		
	
		System.out.println(exSchedule);
		Assert.assertNotNull(exSchedule); 
		
		Assert.assertEquals(150, exSchedule.getExScCalorie());
		Assert.assertEquals("�߶����", exSchedule.getExScContents());
		Assert.assertEquals("��������", exSchedule.getExScName());
		Assert.assertEquals("testUser", exSchedule.getUserId());
	
	 }
		
	 /*
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	 @Test
	 public void testGetProductListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = claimService.listClaim(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	search.setSearchFilter("1");
	 	map = claimService.listClaim(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3�� �� ����Ʈ ���� : "+totalCount);
	 }
	 */
	
	@Test
		 public void deleteExSchedule() throws Exception{
			 
		 	ExSchedule exSchedule = exScheduleService.getExSchedule(10026);
		 	Assert.assertNotNull(exSchedule); 
		 	
		 	
			//==> console Ȯ��
		 	
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
	 	search.setSearchKeyword("�䳢");
	 	search.setSearchPriceCondition("1");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());	//����ð� �� �Է�?
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
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
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 */
	 
}