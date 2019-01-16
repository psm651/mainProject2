package com.wthealth.service.hashtag.test;

import java.util.ArrayList;
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
import com.wthealth.domain.HashTag;
import com.wthealth.service.hashtag.HashTagService;

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
public class HashTagServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("hashTagServiceImpl")
	private HashTagService hashTagService;

	@Test
	public void testAddHashTag() throws Exception {
		
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTag("#뿅뿅");
		hashTag1.setPostNo("ME10023");
		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTag("#뿅뿅");
		hashTag2.setPostNo("EI10025");
		
		HashTag hashTag3 = new HashTag();
		hashTag3.setHashTag("#뿅뿅");
		hashTag3.setPostNo("EC10020");
		
		
		List<HashTag> hashTag =new ArrayList<HashTag>();
		hashTag.add(hashTag1);
		hashTag.add(hashTag2);
		hashTag.add(hashTag3);
		
		for (int j = 0; j < hashTag.size(); j++) {
			hashTagService.addHashTag(hashTag.get(j));

		}
		//==> console 확인
		System.out.println("test쪽"+hashTag);
		
		//==> API 확인
		Assert.assertEquals("뿅뿅", hashTag.get(0).getHashTag());
		Assert.assertEquals("EI10025", hashTag.get(1).getPostNo());
	}

	//@Test
/*	public void testGetProduct() throws Exception {
		
		Product product = new Product();
		//==> 필요하다면...
		//user.setUserId("testUserId");
		//user.setUserName("testUserName");
		//user.setPassword("testPasswd");
		//user.setSsn("1111112222222");
		//user.setPhone("111-2222-3333");
		//user.setAddr("경기도");
		//user.setEmail("test@test.com");
		
		product = productService.getProduct(10066);

		//==> console 확인
		System.out.println(product);
		
		//==> API 확인
		
		Assert.assertEquals("testProductName", product.getProdName());
		Assert.assertEquals("testProdDetail", product.getProdDetail());
		Assert.assertEquals("20181018", product.getManuDate());
		Assert.assertEquals(1000000, product.getPrice());
		Assert.assertEquals("testProductFile", product.getFileName());

		Assert.assertNotNull(productService.getProduct(10020));
		Assert.assertNotNull(productService.getProduct(10021));
		
	}
	*/
	
	//@Test
	 public void testUpdateHashTag() throws Exception{
		 
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTag("랑랑");
		hashTag1.setPostNo("DC10000");

		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTag("탱탱");
		hashTag2.setPostNo("DC10000");

		
		HashTag hashTag3 = new HashTag();
		hashTag3.setHashTag("퉁퉁");
		hashTag3.setPostNo("DC10000");

		
		
		
		List<HashTag> hashTag =new ArrayList<HashTag>();
		hashTag.add(hashTag1);
		hashTag.add(hashTag2);
		hashTag.add(hashTag3);
		hashTagService.updateHashTag(hashTag);
		/*for (int j = 0; j < hashTag.size(); j++) {
			hashTag.get(j).setPostNo("DC10000");
			hashTagService.updateHashTag(hashTag.get(j));

		}*/
		//==> console 확인
		System.out.println("test쪽"+hashTag);
		
		//==> API 확인
		Assert.assertEquals("랑랑", hashTag.get(0).getHashTag());
		Assert.assertEquals("DC10000", hashTag.get(1).getPostNo());
		
		}
	
	 
	 
	 
	 //==>  주석을 풀고 실행하면....
	// @Test
	 public void testListHashTag() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(5);
	 	search.setSearchKeyword("뿅뿅");
	 	Map<String,Object> map = hashTagService.listHashTag(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(4, list.size());
	 	
		//==> console 확인
	 	/*
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	search.setSearchFilter("1");
	 	map = claimService.listClaim(search);
	 	*/
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 }
	 
	 /*
	//@Test
		 public void testGetProductListByProductN0() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("10042");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			//==> console 확인
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	//search.setSearchCondition("1");
		 	//search.setSearchKeyword("상품");	//현재시간 왜 입력?
		 	//map = productService.getProductList(search);
		 	
		 	//list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	//System.out.println(list);
		 	
		 	//totalCount = (Integer)map.get("totalCount");
		 	//System.out.println(totalCount);
		 }
	 
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
